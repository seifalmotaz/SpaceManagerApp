import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:engine_sql_annotation/engine_sql_annotation.dart';
import 'package:source_gen/source_gen.dart';

const coreChecker = TypeChecker.fromRuntime(FieldSQL);

class AnnoClassVisitor extends SimpleElementVisitor {
  final String name;
  List<Map<String, dynamic>> fields = [];

  AnnoClassVisitor(this.name);

  @override
  visitFieldElement(FieldElement element) {
    if (element.name != 'runtimeType' && element.name != 'hashCode') {
      Map<String, dynamic> field = {};
      field['element'] = element;
      if (coreChecker.hasAnnotationOfExact(element)) {
        var anno = coreChecker.firstAnnotationOfExact(element);
        if (anno != null) {
          var includeOnCreate = anno.getField('primary');
          field['primary'] = includeOnCreate!.toBoolValue()!;
        }
      }
      field['primary'] ??= false;
      fields.add(field);
    }
  }
}
