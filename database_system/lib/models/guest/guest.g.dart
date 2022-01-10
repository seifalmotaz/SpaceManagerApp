// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Guest _$GuestFromJson(Map<String, dynamic> json) => Guest(
      createdDate: DataCompiler.fromDBDate(json['created_date'] as int),
      email: json['email'] as String,
      id: json['id'] as int,
      isAdmin: json['is_admin'] as bool,
      isExpired: json['is_expired'] as bool,
      isStaff: json['is_staff'] as bool,
      name: json['name'] as String,
      nationalID: json['national_i_d'] as String,
      nationalIdPic: json['national_id_pic'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$GuestToJson(Guest instance) => <String, dynamic>{
      'id': instance.id,
      'created_date': DataCompiler.toDBDate(instance.createdDate),
      'is_expired': instance.isExpired,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'is_admin': instance.isAdmin,
      'is_staff': instance.isStaff,
      'national_i_d': instance.nationalID,
      'national_id_pic': instance.nationalIdPic,
    };

// **************************************************************************
// Generator: QuerysGen
// **************************************************************************

// hello

// **************************************************************************
// Generator: SqlFieldsGen
// **************************************************************************

extension GuestTable on Guest {
  static Map<String, dynamic> getStartWithString_(String string, Map data) {
    Map<String, dynamic> newData = {};
    for (String key in data.keys.toList()) {
      if (key.startsWith(string)) {
        String k = key.substring(string.length + 1);
        newData.addAll({k: data[key]});
      }
    }
    return newData;
  }

  /// Field data: field ///
  static String id = 'id';
  static String nativeId = 'guest.id';

  /// Field data: field ///
  static String createdDate = 'created_date';
  static String nativeCreatedDate = 'guest.created_date';

  /// Field data: field ///
  static String isExpired = 'is_expired';
  static String nativeIsExpired = 'guest.is_expired';

  /// Field data: field ///
  static String name = 'name';
  static String nativeName = 'guest.name';

  /// Field data: field ///
  static String email = 'email';
  static String nativeEmail = 'guest.email';

  /// Field data: field ///
  static String phone = 'phone';
  static String nativePhone = 'guest.phone';

  /// Field data: field ///
  static String password = 'password';
  static String nativePassword = 'guest.password';

  /// Field data: field ///
  static String isAdmin = 'is_admin';
  static String nativeIsAdmin = 'guest.is_admin';

  /// Field data: field ///
  static String isStaff = 'is_staff';
  static String nativeIsStaff = 'guest.is_staff';

  /// Field data: field ///
  static String nationalID = 'national_i_d';
  static String nativeNationalID = 'guest.national_i_d';

  /// Field data: field ///
  static String nationalIdPic = 'national_id_pic';
  static String nativeNationalIdPic = 'guest.national_id_pic';

  static const String sqlSelect = """
    guest.id AS guest_id,
    guest.created_date AS guest_created_date,
    guest.is_expired AS guest_is_expired,
    guest.name AS guest_name,
    guest.email AS guest_email,
    guest.phone AS guest_phone,
    guest.password AS guest_password,
    guest.is_admin AS guest_is_admin,
    guest.is_staff AS guest_is_staff,
    guest.national_i_d AS guest_national_i_d,
    guest.national_id_pic AS guest_national_id_pic,
  """;

  static fromJson(Map<String, dynamic> json) =>
      _$GuestFromJson(getStartWithString_('guest', json));
}
