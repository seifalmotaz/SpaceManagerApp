import 'package:engine_sql/annotations.dart';
import 'package:engine_sql/helpers/helper.dart';
import 'package:engine_sql/helpers/query/func.dart';
import 'package:engine_sql/helpers/sql_fields/writing.dart';
import 'package:engine_sql/visitor/anno_class.dart';
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
    // get table name
    String name = annotation.read('name').stringValue;
    String sqlite = annotation.read('sqlite').stringValue;

    helper.curlyBrackets('class ${visitor.name}Query', () {
      // buf.writeln("final Database db;");
      // buf.writeln("${visitor.name}Query(this.db);");
      buf.writeln();
      buf.writeln("""
      Future<int> create({
        ${getFuncParms(visitor.fields)}
      }) async => await $sqlite.insert('$name', {
        ${getFuncFields(visitor.fields)}
      });
      """);
      buf.writeln();
      buf.writeln("""
      Future<${visitor.name}> read(int id) async {
        List<Map<String, dynamic>> data = await $sqlite.query(
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
        ${getFuncParms(visitor.fields)}
      }) async => await $sqlite.update(
        '$name',
        {
          ${getFuncFields(visitor.fields)}
        },
        where: 'id = ?',
        whereArgs: [id],
      );
      """);
      buf.writeln();
      buf.writeln("""
      Future<int> delete(int id
      ) async => await $sqlite.delete(
        '$name', 
        where: 'id = ?', 
        whereArgs: [id],
      );
      """);
      buf.writeln();
      StringBuffer stringBuffer = StringBuffer();
      bool moreThanOne = false;
      for (Map field in visitor.fields) {
        if (!field['primary']) {
          String fieldName = getSnakeFieldName(field['element'].name);
          if (!moreThanOne) {
            stringBuffer.writeln(
                '\${${field['element'].name} == null ? "" : "$name.$fieldName IS NOT NULL"}');
            moreThanOne = true;
          } else {
            stringBuffer.writeln(
                '          \${${field['element'].name} == null ? "" : "AND $name.$fieldName IS NOT NULL"}');
          }
        }
      }
      buf.writeln("""
      Future<List<${visitor.name}>> find({
        ${getFuncParms(visitor.fields)}
      }) async {
        List<Map<String, dynamic>> data = await $sqlite.query(
          '$name', 
          where: '''
          ${stringBuffer.toString()}
          AND \${${visitor.name}Table.sqlFindSchema}
          ''', 
          whereArgs: [${getFuncFieldNames(visitor.fields)}],
        );

        return data.map((e) => ${visitor.name}.fromJson(e)).toList();
      }
      """);
      buf.writeln();
    });

    return buf.toString();
  }
}
