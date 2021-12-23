import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class Guest with _$Guest {
  factory Guest({
    int? id,
    // Info data
    String? name,
    String? phone,
    String? email,
    String? gender,
    String? career,
    // Extra data
    String? nationalId,
    String? nationalIdPic,
    // Auth data
    String? password,
    @JsonKey(fromJson: _fromBoolJsone, toJson: _toBoolJsone) bool? isAdmin,
    @JsonKey(fromJson: _fromBoolJsone, toJson: _toBoolJsone) bool? isStaff,
    // Date time data
    @JsonKey(name: 'created_date', fromJson: _fromDateJson, toJson: _toDateJson)
        DateTime? createdDate,
  }) = _Guest;

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);

  // datetime
  static DateTime _fromDateJson(String date) => DateTime.parse(date);
  static String _toDateJson(DateTime date) => date.toIso8601String();

  static bool _fromBoolJsone(int i) => i == 1 ? true : false;
  static int _toBoolJsone(bool i) => i == true ? 1 : 0;
}
