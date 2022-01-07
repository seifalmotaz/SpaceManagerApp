import 'package:database_system/generators/src/engine_sql.dart';
import 'package:database_system/models/func.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest.freezed.dart';
part 'guest.g.dart';

@freezed
class Guest with _$Guest {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Guest({
    // Main data
    int? id,
    @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
        DateTime? createdDate,
    bool? isExpired,
    // main info data
    String? name,
    String? email,
    String? phone,
    // auth data
    String? password,
    bool? isAdmin,
    bool? isStaff,
    // National ID data
    String? nationalID,
    String? nationalIdPic,
  }) = _Guest;

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);
}

@EngineSQL('guest')
class GuestFields {
  static String id = 'id';
  static String name = 'name';
  static String email = 'email';
  static String phone = 'phone';
  static String password = 'password';
  static String nationalID = 'national_id';
  static String nationalIdPic = 'national_id_pic';
  static String isAdmin = 'is_admin';
  static String isStaff = 'is_staff';
  static String isExpired = 'is_expired';
  static String createdDate = 'created_date';
}
