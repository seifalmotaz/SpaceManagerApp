import 'package:database_system/db/service.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:engine_sql/engine_sql.dart';

import '../func.dart';
part 'course.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'course', sqlite: 'DBService.to.db')
class Course {
  @FieldSQL(primary: true)
  final int id;

  int lecturerId;
  double totalPrice;
  String name;
  String description;
  @dateTimeKey
  DateTime startTime;
  @dateTimeKey
  DateTime endTime;
  @boolKey
  bool isExpired;

  Course({
    required this.id,
    required this.description,
    required this.endTime,
    required this.isExpired,
    required this.lecturerId,
    required this.name,
    required this.startTime,
    required this.totalPrice,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
