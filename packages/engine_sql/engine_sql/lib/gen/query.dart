import 'package:engine_sql/helpers/helper.dart';
import 'package:engine_sql/helpers/query/func.dart';
import 'package:engine_sql/helpers/sql_fields/writing.dart';
import 'package:engine_sql/visitor/anno_class.dart';
import 'package:engine_sql_annotation/engine_sql_annotation.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';

class QuerysGen extends GeneratorForAnnotation<EngineSQL> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    // writing settings
    StringBuffer buf = StringBuffer();
    WritingHelper helper = WritingHelper(buf);
    // get element as class
    AnnoClassVisitor visitor = AnnoClassVisitor(element.name!);
    (element).visitChildren(visitor);
    AnnoClassVisitor extendedClass = AnnoClassVisitor('extended class');
    (element as ClassElement).supertype?.element.visitChildren(extendedClass);
    List<Map> totalFields = visitor.fields + extendedClass.fields;
    // get table name
    String name = annotation.read('name').stringValue;

    helper.curlyBrackets('class ${visitor.name}Query', () {
      buf.writeln("final Database db;");
      buf.writeln("${visitor.name}Query(this.db);");
      buf.writeln();
      buf.writeln("""
      Future<int> create({
        ${getFuncParmsSchema(totalFields)}
      }) async => await db.insert('$name', {
        ${getFuncFields(totalFields)}
      });
      """);
      buf.writeln();
      buf.writeln("""
      Future<${visitor.name}> read(int id) async {
        List<Map<String, dynamic>> data = await db.query(
          '$name', 
          where: 'id = ?', 
          whereArgs: [id],
        );
        return ${visitor.name}.fromJson(data.first);
      }
      """);
      buf.writeln();
      buf.writeln("""
      Future<int> update({
        required int id,
        ${getFuncParms(totalFields)}
      }) async => await db.update(
        '$name',
        {
          ${getFuncFields(totalFields)}
        },
        where: 'id = ?',
        whereArgs: [id],
      );
      """);
      buf.writeln();
      buf.writeln("""
      Future<int> delete(int id
      ) async => await db.delete(
        '$name', 
        where: 'id = ?', 
        whereArgs: [id],
      );
      """);
      buf.writeln();
      StringBuffer stringBuffer = StringBuffer();
      // bool moreThanOne = false;
      stringBuffer.writeln('List<String> searchFields = [];');
      for (Map field in totalFields) {
        if (!field['primary']) {
          String fieldName = getSnakeFieldName(field['element'].name);
          stringBuffer.writeln('if (${field['element'].name} != null) {');
          stringBuffer.writeln('searchFields.add("$name.$fieldName = ?");');
          stringBuffer.writeln('}');
        }
      }
      stringBuffer.writeln();
      stringBuffer.writeln('StringBuffer buf = StringBuffer();');
      stringBuffer.writeln('for (int i=0; i < searchFields.length; i++) {');
      stringBuffer.writeln('if (i == 0) buf.writeln(searchFields[i]);');
      stringBuffer
          .writeln('if (i != 0) buf.writeln("AND " + searchFields[i]);');
      stringBuffer.writeln('}');
      // for (Map field in totalFields) {
      //   if (!field['primary']) {
      //     String fieldName = getSnakeFieldName(field['element'].name);
      //     if (!moreThanOne) {
      //       stringBuffer.writeln(
      //           "\${${field['element'].name} == null ? '' : '$name.$fieldName = \${field['element'].name}'}");
      //       moreThanOne = true;
      //     } else {
      //       stringBuffer.writeln(
      //           "          \${${field['element'].name} == null ? '' : 'AND $name.$fieldName = \${field['element'].name}'}'}");
      //     }
      //   }
      // }
      buf.writeln("""
      Future<List<${visitor.name}>> find({
        ${getFuncParms(totalFields)}
      }) async {
        ${stringBuffer.toString()}

        List<Map<String, dynamic>> data = await db.query(
          '$name', 
          where: '''
          \${buf.toString()}
          \${buf.toString().isNotEmpty ? "AND" : ""} \${${visitor.name}Table.sqlFindSchema}
          ''', 
          whereArgs: [${getFuncFieldNames(totalFields)}],
        );

        return data.map((e) => ${visitor.name}.fromJson(e)).toList();
      }
      """);
      buf.writeln();
    });

    return buf.toString();
  }
}
