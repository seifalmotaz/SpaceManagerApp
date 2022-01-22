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
  String? description;

  @jsonKey
  Map? options;

  @boolNullKey
  @FieldSQL(haveDefault: true)
  bool? isDefault;

  @boolNullKey
  @FieldSQL(haveDefault: true)
  bool? isDeleted;

  @boolNullKey
  @FieldSQL(haveDefault: true)
  bool? isPerDay;

  @dateNullTimeKey
  @FieldSQL(haveDefault: true)
  DateTime? createdDate;

  Price({
    required this.id,
    required this.rate,
    this.options,
    this.isPerDay,
    this.isDefault,
    this.isDeleted,
    this.createdDate,
    this.description,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
