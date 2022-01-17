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
    required this.createdDate,
    required this.email,
    required this.id,
    required this.isAdmin,
    required this.isExpired,
    required this.isStaff,
    required this.name,
    required this.nationalId,
    required this.nationalIdPic,
    required this.password,
    required this.phone,
  });

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);
  Map<String, dynamic> toJson() => _$GuestToJson(this);
}
