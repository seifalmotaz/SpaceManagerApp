import 'package:engine_sql_annotation/engine_sql_annotation.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:database_system/models/func.dart';
import 'package:json_annotation/json_annotation.dart';

part 'price.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'price')
class Price {
  @FieldSQL(primary: true)
  final int id;
  double rate;

  @FieldSQL(haveDefault: true)
  String description;

  @jsonKey
  Map? options;

  @boolKey
  @FieldSQL(haveDefault: true)
  bool isDefault;

  @boolKey
  @FieldSQL(haveDefault: true)
  bool isDeleted;

  @boolKey
  @FieldSQL(haveDefault: true)
  bool isPerDay;

  @dateNullTimeKey
  @FieldSQL(haveDefault: true)
  DateTime? createdDate;

  Price({
    this.options,
    this.createdDate,
    required this.id,
    required this.rate,
    required this.isPerDay,
    required this.isDefault,
    required this.isDeleted,
    required this.description,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
