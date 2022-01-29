import 'package:database_system/models/func.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:engine_sql_annotation/engine_sql_annotation.dart';
import 'package:sqflite_common/sqlite_api.dart';
part 'course_registration.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'course_registration')
class CourseRegistration {
  @FieldSQL(primary: true)
  final int id;

  int guestId;
  int courseId;

  String reservationsPrimaryName;

  @boolKey
  bool isPaid;

  @dateTimeKey
  DateTime createdDate;

  CourseRegistration({
    required this.courseId,
    required this.createdDate,
    required this.guestId,
    required this.id,
    required this.isPaid,
    required this.reservationsPrimaryName,
  });

  factory CourseRegistration.fromJson(Map<String, dynamic> json) =>
      _$CourseRegistrationFromJson(json);
  Map<String, dynamic> toJson() => _$CourseRegistrationToJson(this);
}
