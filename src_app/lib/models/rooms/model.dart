import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class Room with _$Room {
  factory Room({
    required int id,
    // Info data
    String? name,
    required int capacity,
    required double? rate,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
