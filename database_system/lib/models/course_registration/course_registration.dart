import 'package:database_system/generators/src/engine_sql.dart';
import 'package:database_system/models/func.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_registration.freezed.dart';
part 'course_registration.g.dart';

@freezed
class CourseRegistration with _$CourseRegistration {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory CourseRegistration({
    int? id,
    int? guestId,
    int? courseId,
    @JsonKey(fromJson: DataCompiler.fromDBool, toJson: DataCompiler.toDBool)
        bool? isPaid,
    @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
        DateTime? createdDate,
  }) = _CourseRegistration;

  factory CourseRegistration.fromJson(Map<String, dynamic> json) =>
      _$CourseRegistrationFromJson(json);
}

@EngineSQL('course_registration')
class CourseRegistrationFields {
  String? id;
  String? guestId;
  String? courseId;
  String? isPaid;
  String? createdDate;
}
