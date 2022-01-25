import 'package:analyzer/dart/element/element.dart';
import 'package:engine_sql/helpers/sql_fields/writing.dart';

String getFuncParmsSchema(List<Map> fields) {
  StringBuffer createParameters = StringBuffer();
  for (Map field in fields) {
    FieldElement element = field['element'];
    if (!field['primary']) {
      late String type;
      if (!element.type.toString().endsWith('?')) {
        if (!field['haveDefault']) {
          type = 'required ${element.type}';
        } else {
          type = '${element.type}?';
        }
      } else {
        type = '${element.type}';
      }
      createParameters.writeln("$type ${element.name},");
    }
  }
  return createParameters.toString();
}

String getFuncParms(List<Map> fields) {
  StringBuffer createParameters = StringBuffer();
  for (Map field in fields) {
    FieldElement element = field['element'];
    if (!field['primary']) {
      late String type;
      if (element.type.toString().endsWith('?')) {
        type = '${element.type}';
      } else {
        type = '${element.type}?';
      }
      createParameters.writeln("$type ${element.name},");
    }
  }
  return createParameters.toString();
}

String getFuncFields(List<Map> fields) {
  StringBuffer createParameters = StringBuffer();
  for (Map field in fields) {
    FieldElement element = field['element'];
    if (!field['primary']) {
      if (!element.type.toString().startsWith('bool') &&
          !element.type.toString().startsWith('DateTime')) {
        createParameters.writeln("""
        if (${element.name} !=null) 
          '${getSnakeFieldName(element.name)}': ${element.name},
        """);
      } else if (element.type.toString().startsWith('bool')) {
        createParameters.writeln("""
        if (${element.name} !=null) 
          '${getSnakeFieldName(element.name)}': ${element.name} ? 1 : 0,
        """);
      } else if (element.type.toString().startsWith('DateTime')) {
        createParameters.writeln("""
        if (${element.name} !=null) 
          '${getSnakeFieldName(element.name)}': (${element.name}.millisecondsSinceEpoch / 1000).round() as int,
        """);
      }
    }
  }
  return createParameters.toString();
}

String getFuncFieldNames(List<Map> fields) {
  StringBuffer createParameters = StringBuffer();
  for (Map field in fields) {
    FieldElement element = field['element'];
    if (!field['primary']) {
      if (!element.type.toString().startsWith('bool') &&
          !element.type.toString().startsWith('DateTime')) {
        createParameters
            .writeln("if (${element.name} !=null) ${element.name},");
      } else if (element.type.toString().startsWith('bool')) {
        createParameters
            .writeln("if (${element.name} !=null) ${element.name}? 1 : 0,");
      } else if (element.type.toString().startsWith('DateTime')) {
        createParameters.writeln(
            "if (${element.name} !=null) (${element.name}.millisecondsSinceEpoch / 1000).round() as int,");
      }
    }
  }
  return createParameters.toString();
}
