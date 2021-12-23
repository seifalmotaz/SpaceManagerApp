import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class Reservation with _$Reservation {
  factory Reservation({
    int? id,
    @JsonKey(name: 'is_pre_paid', fromJson: _fromBoolJsone, toJson: _toBoolJsone)
        bool? isPrePaId,
    // Date time data
    @JsonKey(name: 'start_time', fromJson: _fromJson, toJson: _toJson)
        DateTime? startTime,
    @JsonKey(name: 'end_time', fromJson: _fromJson, toJson: _toJson)
        DateTime? endTime,
    // Refrensaces
    @JsonKey(name: 'room_id') required int roomId,
    @JsonKey(name: 'course_id') int? courseId,
    @JsonKey(name: 'guest_id') required int guestId,
  }) = _Reservation;

  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);

  // datetime
  static DateTime _fromJson(String date) => DateTime.parse(date);
  static String _toJson(DateTime date) => date.toIso8601String();

  static bool _fromBoolJsone(int i) => i == 1 ? true : false;
  static int _toBoolJsone(bool i) => i == true ? 1 : 0;
}
