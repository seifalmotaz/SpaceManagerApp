import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'engine_sql.dart';

class ToSQLGenerator extends GeneratorForAnnotation<EngineSQL> {
  String getNative(String c, String i) => c + '.' + i;

  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    StringBuffer buf = StringBuffer();
    ClassElement classElement = element as ClassElement;
    List<FieldElement>? nativeFields = classElement.fields;

    buf.writeln('extension ${element.name}SQL on ${element.name} {');
    buf.writeln("");
    buf.write("""
    static Map<String, dynamic> getStartWithString_(String string, Map data) {
      Map<String, dynamic> newData = {};
      for (String key in data.keys.toList()) {
        if (key.startsWith(string)) {
          String k = key.substring(string.length + 1);
          newData.addAll({k: data[key]});
        }
      }
      return newData;
    }
    """);
    buf.writeln("");
    String tableName = annotation.read('tableName').stringValue;
    for (FieldElement field in nativeFields) {
      buf.writeln("// \\ // \\ Start: ${field.name} // \\ // \\");
      // From varFoo To var_foo
      String fieldName = '';
      Map<int, String> _fieldName = {};
      int li = 0;
      for (var i = 0; i < field.name.length; i++) {
        bool wait = field.name[i].contains(RegExp(r'[A-Z]'));
        if (!wait) {
          _fieldName[li] = (_fieldName[li] ?? '') + field.name[i];
        } else {
          li++;
          _fieldName[li] = (_fieldName[li] ?? '') + field.name[i];
        }
      }
      for (String item in _fieldName.values) {
        if (fieldName.isNotEmpty) {
          fieldName = fieldName + '_' + item;
        } else {
          fieldName = fieldName + item;
        }
      }
      String fieldNativeName = getNative(tableName, fieldName.toLowerCase());
      String varName = field.name[0].toUpperCase() + field.name.substring(1);
      buf.writeln("static String native$varName = '$fieldNativeName';");
      buf.writeln(
          "static String ${field.name} = '${fieldName.toLowerCase()}';");
      buf.writeln("// \\ // \\ End: ${field.name} // \\ // \\");
    }

    buf.writeln(' ');
    buf.writeln(
        "static fromJson(Map<String, dynamic> json) => _\$\$_${element.name.replaceAll('Fields', '')}FromJson(getStartWithString_('$tableName', json));");

    buf.writeln('}');
    return buf.toString();
  }
}
