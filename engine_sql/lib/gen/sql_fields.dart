import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:engine_sql/helpers/sql_fields/writing.dart';
import 'package:engine_sql/helpers/helper.dart';
import 'package:engine_sql/visitor/basic_class.dart';
import 'package:engine_sql_annotation/engine_sql_annotation.dart';
import 'package:source_gen/source_gen.dart';

class SqlFieldsGen extends GeneratorForAnnotation<EngineSQL> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    // writing settings
    StringBuffer buf = StringBuffer();
    WritingHelper helper = WritingHelper(buf);
    // get table name
    String name = annotation.read('name').stringValue;
    // get element as class
    ClassElement classElement = element as ClassElement;
    // classes
    BasicClassVisitor mainClass = BasicClassVisitor();
    classElement.visitChildren(mainClass);
    BasicClassVisitor extendedClass = BasicClassVisitor();
    classElement.supertype?.element.visitChildren(extendedClass);
    // all fields
    List<FieldElement> allFields =
        mainClass.fields.toList() + extendedClass.fields.toList();

    //* writing table fields extention
    String extentionName = 'extension ${element.name}Table on ${element.name}';
    helper.curlyBrackets(extentionName, () {
      stander(buf);
      writeFields(buf, name, allFields.map((e) => e.name).toList());
      //
      //* writing native fields to use in sql select statement
      buf.writeln('static const String sqlSelect = """');
      for (var i = 0; i < allFields.length; i++) {
        FieldElement field = allFields[i];
        String fieldName = getSnakeFieldName(field.name);
        if (i == (allFields.length - 1)) {
          buf.writeln("    $name.$fieldName AS ${name}_$fieldName");
        } else {
          buf.writeln("    $name.$fieldName AS ${name}_$fieldName,");
        }
      }
      buf.writeln('  """;');
      //
      buf.writeln();
      buf.writeln('static const String sqlFindSchema = """');
      bool moreThanOne = false;
      for (FieldElement field in allFields) {
        if (!field.type.toString().endsWith('?')) {
          String fieldName = getSnakeFieldName(field.name);
          if (!moreThanOne) {
            buf.writeln("    $name.$fieldName IS NOT NULL");
            moreThanOne = true;
          } else {
            buf.writeln("    AND $name.$fieldName IS NOT NULL");
          }
        }
      }
      buf.writeln('  """;');
      buf.writeln();

      helper.squareBrackets('static const List schemaMap =', () {
        for (FieldElement field in allFields) {
          String fieldName = getSnakeFieldName(field.name);
          buf.writeln("'$fieldName',");
          moreThanOne = true;
        }
      }, true);

      buf.writeln();
      //* writing from sql json data
      buf.writeln("""static fromJson(Map<String, dynamic> json) => 
          _\$${element.name}FromJson(getStartWithString_('$name', json));""");
      buf.writeln();
      String funcName =
          'static ${classElement.name}? schemaToJson(Map<String, dynamic> json)';
      helper.curlyBrackets(funcName, () {
        buf.writeln('bool valid = true;');
        helper.curlyBrackets('for (String i in json.keys)', () {
          helper.curlyBrackets('if (!schemaMap.contains(i))', () {
            buf.writeln('valid = false;');
            buf.writeln('break;');
          });
        });
        helper.curlyBrackets('if (valid)', () {
          buf.writeln('return _\$${element.name}FromJson(json);');
        });
      });
      buf.writeln();
      buf.writeln(
          """static ${classElement.name}? filterFromJson(Map<String, dynamic> json) => 
          schemaToJson(getStartWithString_('$name', json));""");
    });

    return buf.toString();
  }
}
