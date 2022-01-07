Map<String, dynamic> getStartWithString_(String string, Map data) {
  Map<String, dynamic> newData = {};
  for (String key in data.keys.toList()) {
    if (key.startsWith(string)) {
      String k = key.substring(string.length + 1);
      newData.addAll({k: data[key]});
    }
  }
  return newData;
}

class DataCompiler {
  static fromDBool(int? i) => i == null
      ? null
      : i == 1
          ? true
          : false;
  static toDBool(bool? i) => i == null
      ? null
      : i == true
          ? 1
          : 0;

  static DateTime? fromDBDate(int? datetime) => datetime == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(datetime * 1000);
  static int? toDBDate(DateTime? datetime) =>
      datetime == null ? null : (datetime.millisecondsSinceEpoch / 1000) as int;
}
