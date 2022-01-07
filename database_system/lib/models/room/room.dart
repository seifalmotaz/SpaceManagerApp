import 'package:database_system/generators/src/engine_sql.dart';
import 'package:database_system/models/func.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class Room with _$Room {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Room({
    int? id,
    double? rate,
    String? name,
    @JsonKey(fromJson: DataCompiler.fromDBool, toJson: DataCompiler.toDBool)
        bool? isDeleted,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}

@EngineSQL('room')
class RoomFields {
  String? id;
  String? rate;
  String? name;
  String? isDeleted;
}
