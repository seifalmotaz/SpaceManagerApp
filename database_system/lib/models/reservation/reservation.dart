import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation.freezed.dart';
part 'reservation.g.dart';

@freezed
class Reservation with _$Reservation {
  factory Reservation({
    required int id,
    // pricing data
    @JsonKey(name: 'guest_id') required int guestId,
    @JsonKey(name: 'room_id') required int roomId,
    @JsonKey(name: 'paid_amount') required double paidAmount,
    // main data
    @JsonKey(name: 'time_in', fromJson: _fromDBDate, toJson: _toDBDate)
        required DateTime timeIn,
    @JsonKey(name: 'time_out', fromJson: _fromDBDate, toJson: _toDBDate)
        DateTime? timeOut,
    @JsonKey(name: 'created_date', fromJson: _fromDBDate, toJson: _toDBDate)
        DateTime? createdDate,
  }) = _Reservation;

  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);

  static DateTime _fromDBDate(int datetime) =>
      DateTime.fromMillisecondsSinceEpoch(datetime * 1000);
  static int _toDBDate(DateTime datetime) =>
      (datetime.millisecondsSinceEpoch / 1000) as int;
}
