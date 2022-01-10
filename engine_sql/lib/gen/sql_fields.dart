import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:engine_sql/annotations.dart';
import 'package:engine_sql/helpers/sql_fields/writing.dart';
import 'package:engine_sql/helpers/helper.dart';
import 'package:engine_sql/visitor/basic_class.dart';
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
    String tableName = annotation.read('tableName').stringValue;
    // get element as class
    ClassElement classElement = element as ClassElement;
    // classes
    BasicClassVisitor mainClass = BasicClassVisitor();
    classElement.visitChildren(mainClass);
    BasicClassVisitor extendedClass = BasicClassVisitor();
    classElement.supertype?.element.visitChildren(extendedClass);
    // all fields
    List<String> allFields = mainClass.fields.map((e) => e.name).toList() +
        extendedClass.fields.map((e) => e.name).toList();

    //* writing table fields extention
    String extentionName = 'extension ${element.name}Table on ${element.name}';
    helper.curlyBrackets(extentionName, () {
      stander(buf);
      writeFields(buf, tableName, allFields);
      //
      //* writing native fields to use in sql select statement
      buf.writeln('static const String sqlSelect = """');
      for (String field in allFields) {
        String fieldName = getSnakeFieldName(field);
        buf.writeln("    $tableName.$fieldName AS ${tableName}_$fieldName,");
      }
      buf.writeln('  """;');
      //
      buf.writeln('');
      //* writing from sql json data
      buf.writeln("""static fromJson(Map<String, dynamic> json) => 
          _\$${element.name}FromJson(getStartWithString_('$tableName', json));""");
    });

    return buf.toString();
  }
}
