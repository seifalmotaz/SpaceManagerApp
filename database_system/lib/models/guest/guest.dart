import 'package:engine_sql/engine_sql.dart';
import 'package:database_system/models/func.dart';
import 'package:json_annotation/json_annotation.dart';

part 'guest.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@EngineSQL('guest')
class Guest {
  // Main data
  int id;
  @dateTimeKey
  DateTime createdDate;
  bool isExpired;
  // main info data
  String name;
  String email;
  String phone;
  // auth data
  String password;
  bool isAdmin;
  bool isStaff;
  // National ID data
  String nationalID;
  String nationalIdPic;
  Guest({
    required this.createdDate,
    required this.email,
    required this.id,
    required this.isAdmin,
    required this.isExpired,
    required this.isStaff,
    required this.name,
    required this.nationalID,
    required this.nationalIdPic,
    required this.password,
    required this.phone,
  });

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);
  Map<String, dynamic> toJson() => _$GuestToJson(this);
}
