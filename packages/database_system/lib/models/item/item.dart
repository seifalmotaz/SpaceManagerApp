import 'package:engine_sql_annotation/engine_sql_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sqflite_common/sqlite_api.dart';

import '../func.dart';
part 'item.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'item')
class Item {
  @FieldSQL(primary: true)
  final int id;
  double price;
  String name;

  @dateNullTimeKey
  @FieldSQL(haveDefault: true)
  DateTime? createdDate;

  Item({
    required this.id,
    required this.price,
    required this.name,
    this.createdDate,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
