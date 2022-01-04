import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest.freezed.dart';
part 'guest.g.dart';

@freezed
class Guest with _$Guest {
  factory Guest({
    // Main data
    required int id,
    @JsonKey(name: 'created_date', fromJson: _fromDBDate, toJson: _toDBDate)
        required DateTime createdDate,
    @JsonKey(name: 'is_expired') required bool isExpired,
    // main info data
    String? name,
    String? email,
    String? phone,
    // auth data
    String? password,
    @JsonKey(name: 'is_admin') required bool isAdmin,
    @JsonKey(name: 'is_staff') required bool isStaff,
    // National ID data
    @JsonKey(name: 'national_id') String? nationalID,
    @JsonKey(name: 'national_id_pic') String? nationalIdPic,
  }) = _Guest;

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);

  static DateTime _fromDBDate(int datetime) =>
      DateTime.fromMillisecondsSinceEpoch(datetime * 1000);

  static int _toDBDate(DateTime datetime) =>
      (datetime.millisecondsSinceEpoch / 1000) as int;
}
