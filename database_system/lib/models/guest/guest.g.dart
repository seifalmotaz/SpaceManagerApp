// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Guest _$$_GuestFromJson(Map<String, dynamic> json) => _$_Guest(
      id: json['id'] as int,
      createdDate: DateTime.parse(json['created_date'] as String),
      isExpired: json['is_expired'] as bool,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      isAdmin: json['is_admin'] as bool,
      isStaff: json['is_staff'] as bool,
      nationalID: json['national_id'] as String?,
      nationalIdPic: json['national_id_pic'] as String?,
    );

Map<String, dynamic> _$$_GuestToJson(_$_Guest instance) => <String, dynamic>{
      'id': instance.id,
      'created_date': instance.createdDate.toIso8601String(),
      'is_expired': instance.isExpired,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'is_admin': instance.isAdmin,
      'is_staff': instance.isStaff,
      'national_id': instance.nationalID,
      'national_id_pic': instance.nationalIdPic,
    };
