import 'package:database_system/generators/src/engine_sql.dart';
import 'package:database_system/models/func.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price.freezed.dart';
part 'price.g.dart';

@freezed
class Price with _$Price {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Price({
    int? id,
    double? rate,
    String? description,
    @JsonKey(fromJson: DataCompiler.fromDBool, toJson: DataCompiler.toDBool)
        bool? isDefault,
    @JsonKey(fromJson: DataCompiler.fromDBool, toJson: DataCompiler.toDBool)
        bool? isDeleted,
    @JsonKey(fromJson: DataCompiler.fromDBool, toJson: DataCompiler.toDBool)
        bool? isPerDay,
    @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
        DateTime? createdDate,
  }) = _Price;

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
}

@EngineSQL('price')
class PriceFields {
  String? id;
  String? rate;
  String? description;
  String? isDefault;
  String? isDeleted;
  String? isPerDay;
  String? createdDate;
}
