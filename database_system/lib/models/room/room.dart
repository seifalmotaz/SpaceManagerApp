import 'package:engine_sql/engine_sql.dart';
import 'package:database_system/models/func.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:sqflite_common/sqlite_api.dart';
part 'room.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL('room')
class Room {
  @FieldSQL(primary: true)
  final int id;
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
