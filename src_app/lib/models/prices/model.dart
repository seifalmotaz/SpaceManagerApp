import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class Price with _$Price {
  factory Price({
    required int id,
    // Info data
    required double rate,
    required String description,
    @JsonKey(name: 'is_default', fromJson: _fromBoolJsone, toJson: _toBoolJsone)
        required bool isDefault,
  }) = _Price;

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  static bool _fromBoolJsone(int i) => i == 1 ? true : false;
  static int _toBoolJsone(bool i) => i == true ? 1 : 0;
}
