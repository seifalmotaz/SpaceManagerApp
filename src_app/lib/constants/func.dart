DateTime? fromDateDB(String? date) {
  if (date != null) {
    if (date.endsWith('Z')) {
      return DateTime.parse(date).toLocal();
    } else {
      return DateTime.parse(date + 'Z').toLocal();
    }
  }
}

Map<String, dynamic> getDataStartWithString_(String string, Map data) {
  Map<String, dynamic> newData = {};
  for (String key in data.keys.toList()) {
    if (key.startsWith(string)) {
      String k = key.split('_')[1];
      newData.addAll({k: data[key]});
    }
  }
  return newData;
}
