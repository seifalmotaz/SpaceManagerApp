import 'package:engine_sql/engine_sql.dart';
import 'package:database_system/models/func.dart';
import 'package:json_annotation/json_annotation.dart';

part 'price.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@EngineSQL('price')
class Price {
  int id;
  double rate;
  String description;
  @boolKey
  bool isDefault;
  @boolKey
  bool isDeleted;
  @boolKey
  bool isPerDay;
  @dateTimeKey
  DateTime createdDate;
  Price({
    required this.createdDate,
    required this.description,
    required this.id,
    required this.isDefault,
    required this.isDeleted,
    required this.isPerDay,
    required this.rate,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
