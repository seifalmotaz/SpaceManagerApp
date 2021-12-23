import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class Bill with _$Bill {
  factory Bill({
    required int id,
    required double total,
    @JsonKey(name: 'staff_id') required int staffId,
    @JsonKey(name: 'session_id') required int sessionId,
    @JsonKey(name: 'reservation_id') required int reservationId,
  }) = _Bill;

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);
}
