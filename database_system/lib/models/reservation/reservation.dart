import 'package:database_system/generators/src/engine_sql.dart';
import 'package:database_system/models/func.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation.freezed.dart';
part 'reservation.g.dart';

@freezed
class Reservation with _$Reservation {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Reservation({
    int? id,
    // pricing data
    int? guestId,
    int? roomId,
    double? paidAmount,
    // main data
    @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
        DateTime? timeIn,
    @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
        DateTime? timeOut,
    @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
        DateTime? createdDate,
  }) = _Reservation;

  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);
}

@EngineSQL('reservation')
class ReservationFields {
  String? id;
  String? guestId;
  String? roomId;
  String? paidAmount;
  String? timeIn;
  String? timeOut;
  String? createdDate;
}
