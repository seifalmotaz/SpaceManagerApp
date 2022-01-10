import 'package:database_system/models/func.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:engine_sql/engine_sql.dart';

part 'course_registration.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@EngineSQL('course_registration')
class CourseRegistration {
  int id;
  int guestId;
  int courseId;
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
  });

  factory CourseRegistration.fromJson(Map<String, dynamic> json) =>
      _$CourseRegistrationFromJson(json);
  Map<String, dynamic> toJson() => _$CourseRegistrationToJson(this);
}
