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

const boolKey = JsonKey(
  fromJson: DataCompiler.fromDBool,
  toJson: DataCompiler.toDBool,
);

class DataCompiler {
  static fromDBool(int i) => i == 1 ? true : false;
  static toDBool(bool i) => i == true ? 1 : 0;

  static Map? fromJsonString(String? i) => i == null ? null : jsonDecode(i);
  static String? toJsonString(Map? i) => i == null ? null : jsonEncode(i);

  static DateTime fromDBDate(int datetime) =>
      DateTime.fromMillisecondsSinceEpoch(datetime * 1000);
  static int toDBDate(DateTime datetime) =>
      (datetime.millisecondsSinceEpoch / 1000) as int;
}
