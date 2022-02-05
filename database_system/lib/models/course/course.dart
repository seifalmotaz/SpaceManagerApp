import 'package:engine_sql_annotation/engine_sql_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sqflite_common/sqlite_api.dart';

import '../func.dart';
part 'course.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'course')
class Course {
  @FieldSQL(primary: true)
  final int id;

  int lecturerId;
  double totalPrice;
  String name;
  String description;

  @boolNullKey
  @FieldSQL(haveDefault: true)
  bool? isDeleted;

  @dateNullTimeKey
  @FieldSQL(haveDefault: true)
  DateTime? createdDate;

  Course({
    required this.id,
    required this.description,
    required this.lecturerId,
    required this.name,
    required this.totalPrice,
    this.isDeleted,
    this.createdDate,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
