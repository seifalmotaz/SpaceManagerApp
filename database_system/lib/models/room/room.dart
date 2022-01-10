import 'package:engine_sql/engine_sql.dart';
import 'package:database_system/models/func.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@EngineSQL('room')
class Room {
  int id;
  double rate;
  String name;
  @boolKey
  bool isDeleted;

  Room({
    required this.id,
    required this.isDeleted,
    required this.name,
    required this.rate,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
