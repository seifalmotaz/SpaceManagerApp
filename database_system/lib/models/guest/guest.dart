import 'package:engine_sql_annotation/engine_sql_annotation.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:database_system/models/func.dart';
import 'package:json_annotation/json_annotation.dart';

part 'guest.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'guest')
class Guest {
  // Main data
  @FieldSQL(primary: true)
  final int id;

  @dateTimeKey
  @FieldSQL(haveDefault: true)
  DateTime createdDate;

  @boolKey
  @FieldSQL(haveDefault: true)
  bool isExpired;
  // main info data
  String? name;
  String? email;
  String? phone;
  String? gender;
  // auth data
  String? password;

  @boolKey
  @FieldSQL(haveDefault: true)
  bool isAdmin;

  @boolKey
  @FieldSQL(haveDefault: true)
  bool isStaff;
  // National ID data
  String? nationalId;
  String? nationalIdPic;
  Guest({
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.password,
    this.nationalId,
    this.nationalIdPic,
    required this.id,
    required this.isAdmin,
    required this.isExpired,
    required this.isStaff,
    required this.createdDate,
  });

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);
  Map<String, dynamic> toJson() => _$GuestToJson(this);

  @override
  String toString() {
    if (name != null) return name!;
    if (email != null) return email!;
    if (phone != null) return phone!;
    return 'None';
  }

  /// Number from '97645893609387'
  ///
  /// to '9764 5893 6093 87'
  String? readableNationalId() {
    if (nationalId != null && nationalId!.isNotEmpty) {
      String string = '';
      int letter4 = 0;
      for (var i = 0; i < nationalId!.length; i++) {
        if (letter4 < 4) {
          string = string + nationalId![i];
          letter4++;
        } else if (letter4 == 4) {
          string = string + ' ' + nationalId![i];
          letter4 = 0;
        }
      }
    }
  }
}
