// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Guest _$$_GuestFromJson(Map<String, dynamic> json) => _$_Guest(
      id: json['id'] as int?,
      createdDate: DataCompiler.fromDBDate(json['created_date'] as int?),
      isExpired: json['is_expired'] as bool?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      isAdmin: json['is_admin'] as bool?,
      isStaff: json['is_staff'] as bool?,
      nationalID: json['national_i_d'] as String?,
      nationalIdPic: json['national_id_pic'] as String?,
    );

Map<String, dynamic> _$$_GuestToJson(_$_Guest instance) => <String, dynamic>{
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
// EngineSQLGenerator
// **************************************************************************

extension GuestFieldsSQL on GuestFields {
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

// \ // \ Start: id // \ // \
  static String nativeId = 'guest.id';
  static String id = 'id';
// \ // \ End: id // \ // \
// \ // \ Start: name // \ // \
  static String nativeName = 'guest.name';
  static String name = 'name';
// \ // \ End: name // \ // \
// \ // \ Start: email // \ // \
  static String nativeEmail = 'guest.email';
  static String email = 'email';
// \ // \ End: email // \ // \
// \ // \ Start: phone // \ // \
  static String nativePhone = 'guest.phone';
  static String phone = 'phone';
// \ // \ End: phone // \ // \
// \ // \ Start: password // \ // \
  static String nativePassword = 'guest.password';
  static String password = 'password';
// \ // \ End: password // \ // \
// \ // \ Start: nationalID // \ // \
  static String nativeNationalID = 'guest.national_i_d';
  static String nationalID = 'national_i_d';
// \ // \ End: nationalID // \ // \
// \ // \ Start: nationalIdPic // \ // \
  static String nativeNationalIdPic = 'guest.national_id_pic';
  static String nationalIdPic = 'national_id_pic';
// \ // \ End: nationalIdPic // \ // \
// \ // \ Start: isAdmin // \ // \
  static String nativeIsAdmin = 'guest.is_admin';
  static String isAdmin = 'is_admin';
// \ // \ End: isAdmin // \ // \
// \ // \ Start: isStaff // \ // \
  static String nativeIsStaff = 'guest.is_staff';
  static String isStaff = 'is_staff';
// \ // \ End: isStaff // \ // \
// \ // \ Start: isExpired // \ // \
  static String nativeIsExpired = 'guest.is_expired';
  static String isExpired = 'is_expired';
// \ // \ End: isExpired // \ // \
// \ // \ Start: createdDate // \ // \
  static String nativeCreatedDate = 'guest.created_date';
  static String createdDate = 'created_date';
// \ // \ End: createdDate // \ // \

  static fromJson(Map<String, dynamic> json) =>
      _$$_GuestFromJson(getStartWithString_('guest', json));
}
