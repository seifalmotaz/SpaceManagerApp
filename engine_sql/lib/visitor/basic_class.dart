import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/element.dart';

class BasicClassVisitor extends SimpleElementVisitor {
  String className = '';
  List<FieldElement> fields = [];
  @override
  visitConstructorElement(ConstructorElement element) {
    className = element.name;
  }

  @override
  visitFieldElement(FieldElement element) {
    if (element.name != 'runtimeType' && element.name != 'hashCode') {
      fields.add(element);
    }
  }
}
