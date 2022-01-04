import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class Room with _$Room {
  factory Room({
    required int id,
    required double rate,
    required String name,
    @JsonKey(name: 'is_deleted', fromJson: _fromDBool, toJson: _toDBool)
        required bool isDeleted,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  static _fromDBool(int i) => i == 1 ? true : false;
  static _toDBool(bool i) => i == true ? 1 : 0;
}
