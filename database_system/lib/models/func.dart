import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

const jsonKey = JsonKey(
  fromJson: DataCompiler.fromJsonString,
  toJson: DataCompiler.toJsonString,
);

const dateTimeKey = JsonKey(
  fromJson: DataCompiler.fromDBDate,
  toJson: DataCompiler.toDBDate,
);

const dateNullTimeKey = JsonKey(
  fromJson: DataCompiler.fromDBDateNull,
  toJson: DataCompiler.toDBDateNull,
);

const boolKey = JsonKey(
  fromJson: DataCompiler.fromDBool,
  toJson: DataCompiler.toDBool,
);

const boolNullKey = JsonKey(
  fromJson: DataCompiler.fromDBoolNull,
  toJson: DataCompiler.toDBoolNull,
);

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
  static fromDBool(int i) => i == 1 ? true : false;
  static toDBool(bool i) => i == true ? 1 : 0;

  static bool? fromDBoolNull(int? i) => i == 1 ? true : false;
  static int? toDBoolNull(bool? i) => i == true ? 1 : 0;

  static Map? fromJsonString(String? i) => i == null ? null : jsonDecode(i);
  static String? toJsonString(Map? i) => i == null ? null : jsonEncode(i);

  static DateTime fromDBDate(int datetime) =>
      DateTime.fromMillisecondsSinceEpoch(datetime * 1000);
  static int toDBDate(DateTime datetime) =>
      (datetime.millisecondsSinceEpoch / 1000).round();

  static DateTime? fromDBDateNull(int? datetime) => datetime == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(datetime * 1000);
  static int? toDBDateNull(DateTime? datetime) => datetime == null
      ? null
      : (datetime.millisecondsSinceEpoch / 1000).round();
}
