import 'package:freezed_annotation/freezed_annotation.dart';

part 'rsession.freezed.dart';
part 'rsession.g.dart';

@freezed
class RSession with _$RSession {
  factory RSession({
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
  }) = _RSession;

  factory RSession.fromJson(Map<String, dynamic> json) =>
      _$RSessionFromJson(json);

  static DateTime _fromDBDate(int datetime) =>
      DateTime.fromMillisecondsSinceEpoch(datetime * 1000);

  static int _toDBDate(DateTime datetime) =>
      (datetime.millisecondsSinceEpoch / 1000) as int;
}
