import 'package:freezed_annotation/freezed_annotation.dart';

part 'price.freezed.dart';
part 'price.g.dart';

@freezed
class Price with _$Price {
  factory Price({
    required int id,
    required double rate,
    required String description,
    @JsonKey(name: 'is_default', fromJson: _fromDBool, toJson: _toDBool)
        required bool isDefault,
    @JsonKey(name: 'is_deleted', fromJson: _fromDBool, toJson: _toDBool)
        required bool isDeleted,
    @JsonKey(name: 'is_per_day', fromJson: _fromDBool, toJson: _toDBool)
        required bool isPerDay,
    @JsonKey(name: 'created_date', fromJson: _fromDBDate, toJson: _toDBDate)
        required DateTime createdDate,
  }) = _Price;

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  static _fromDBool(int i) => i == 1 ? true : false;
  static _toDBool(bool i) => i == true ? 1 : 0;
  static DateTime _fromDBDate(int datetime) =>
      DateTime.fromMillisecondsSinceEpoch(datetime * 1000);
  static int _toDBDate(DateTime datetime) =>
      (datetime.millisecondsSinceEpoch / 1000) as int;
}
