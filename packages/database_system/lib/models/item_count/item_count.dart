import 'package:engine_sql_annotation/engine_sql_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sqflite_common/sqlite_api.dart';

import '../func.dart';
part 'item_count.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'item_count')
class ItemCount {
  @FieldSQL(primary: true)
  final int id;
  int insertCount;
  int currentCount;
  int itemId;

  @dateNullTimeKey
  @FieldSQL(haveDefault: true)
  DateTime? createdDate;

  ItemCount({
    required this.id,
    required this.insertCount,
    required this.currentCount,
    required this.itemId,
    this.createdDate,
  });

  factory ItemCount.fromJson(Map<String, dynamic> json) =>
      _$ItemCountFromJson(json);
  Map<String, dynamic> toJson() => _$ItemCountToJson(this);
}
