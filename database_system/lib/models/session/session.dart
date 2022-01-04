import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session {
  factory Session({
    required int id,
    // pricing data
    @JsonKey(name: 'guest_id') required int guestId,
    @JsonKey(name: 'price_id') required int priceId,
    @JsonKey(name: 'paid_amount') required double paidAmount,
    // extra info
    @JsonKey(name: 'guest_count') required int guestCount,
    // main data
    @JsonKey(name: 'time_in', fromJson: _fromDBDate, toJson: _toDBDate)
        required DateTime timeIn,
    @JsonKey(name: 'time_out', fromJson: _fromDBDate, toJson: _toDBDate)
        DateTime? timeOut,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  static DateTime _fromDBDate(int datetime) =>
      DateTime.fromMillisecondsSinceEpoch(datetime * 1000);

  static int _toDBDate(DateTime datetime) =>
      (datetime.millisecondsSinceEpoch / 1000) as int;
}
