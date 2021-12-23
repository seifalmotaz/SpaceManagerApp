import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class Session with _$Session {
  factory Session({
    int? id,
    @JsonKey(name: 'guests_count') int? guestsCount,
    // Date time data
    @JsonKey(name: 'start_time', fromJson: _fromJson, toJson: _toJson)
        DateTime? startTime,
    @JsonKey(name: 'end_time', fromJson: _fromJson, toJson: _toJson)
        DateTime? endTime,
    // Main references
    @JsonKey(name: 'guest_id') required int guestId,
    //  Pricing references
    @JsonKey(name: 'room_id') int? roomId,
    @JsonKey(name: 'price_id') int? priceId,
    @JsonKey(name: 'course_id') int? courseId,
    @JsonKey(name: 'reservation_id') int? reservationId,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  // datetime
  static DateTime _fromJson(String date) => DateTime.parse(date);
  static String _toJson(DateTime date) => date.toIso8601String();
}
