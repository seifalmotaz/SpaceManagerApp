import 'package:database_system/generators/src/engine_sql.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../func.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
class Course with _$Course {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Course({
    int? id,
    int? lecturerId,
    double? totalPrice,
    String? name,
    String? description,
    @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
        DateTime? startTime,
    @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
        DateTime? endTime,
    @JsonKey(fromJson: DataCompiler.fromDBool, toJson: DataCompiler.toDBool)
        bool? isExpired,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  factory Course.fromJson_(Map<String, dynamic> json) =>
      _$CourseFromJson(getStartWithString_('course', json));
}

@EngineSQL('course')
class CourseFields {
  String? id;
  String? lecturerId;
  String? totalPrice;
  String? name;
  String? description;
  String? startTime;
  String? endTime;
  String? isExpired;
}
