import 'package:engine_sql_annotation/engine_sql_annotation.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:database_system/models/func.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'room')
class Room {
  @FieldSQL(primary: true)
  final int id;
  double rate;
  String name;
  int capacity;
  @boolNullKey
  @FieldSQL(haveDefault: true)
  bool? isDeleted;

  Room({
    required this.id,
    required this.name,
    required this.rate,
    required this.capacity,
    this.isDeleted,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
