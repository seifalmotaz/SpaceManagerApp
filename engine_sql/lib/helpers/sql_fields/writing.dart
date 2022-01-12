/// Get table name + field name table.field
String getNative(String c, String i) => c + '.' + i;

stander(StringBuffer buf) {
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
}

/// fieldName to field_name
String getSnakeFieldName(String name) {
  String fieldName = '';
  Map<int, String> _fieldName = {};
  int li = 0;
  for (var i = 0; i < name.length; i++) {
    bool wait = name[i].contains(RegExp(r'[A-Z]'));
    if (!wait) {
      _fieldName[li] = (_fieldName[li] ?? '') + name[i];
    } else {
      li++;
      _fieldName[li] = (_fieldName[li] ?? '') + name[i];
    }
  }
  for (String item in _fieldName.values) {
    if (fieldName.isNotEmpty) {
      fieldName = fieldName + '_' + item;
    } else {
      fieldName = fieldName + item;
    }
  }
  return fieldName.toLowerCase();
}

/// add fields names and sql field name
///
/// ```dart
///  var fieldName;
///  ```
/// will be
/// ```dart
/// static String fieldName = 'field_name'
/// ```
writeFields(StringBuffer buf, String name, List<String> allFields) {
  for (String field in allFields) {
    // fieldName to FieldName
    String varName = field[0].toUpperCase() + field.substring(1);
    // get other names
    String fieldSnakeName = getSnakeFieldName(field);
    String fieldNativeName = getNative(name, fieldSnakeName);
    //* writing
    buf.writeln('');
    buf.writeln("/// Field data: field ///");
    buf.writeln("static String $field = '$fieldSnakeName';");
    buf.writeln("static String native$varName = '$fieldNativeName';");
    buf.writeln('');
  }
}
