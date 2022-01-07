import 'package:database_system/generators/src/engine_sql.dart';
import 'package:database_system/models/func.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'creservation.freezed.dart';
part 'creservation.g.dart';

@freezed
class CReservation with _$CReservation {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory CReservation({
    int? id,
    // pricing data
    int? courseId,
    int? roomId,
    // main data
    @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
        DateTime? timeIn,
    @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
        DateTime? timeOut,
    @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
        DateTime? createdDate,
  }) = _CReservation;

  factory CReservation.fromJson(Map<String, dynamic> json) =>
      _$CReservationFromJson(json);
}

@EngineSQL('creservation')
class CReservationFields {
  static String id = 'id';
  static String courseId = 'course_id';
  static String roomId = 'room_id';
  static String timeIn = 'time_in';
  static String timeOut = 'time_out';
  static String createdDate = 'created_date';
}
