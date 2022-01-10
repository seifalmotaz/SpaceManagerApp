import 'package:engine_sql/annotations.dart';
import 'package:engine_sql/helpers/helper.dart';
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
    // get table name
    String tableName = annotation.read('tableName').stringValue;
    return '// hello';
  }
}
