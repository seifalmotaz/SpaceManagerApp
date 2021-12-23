// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Guest _$$_GuestFromJson(Map<String, dynamic> json) => _$_Guest(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      career: json['career'] as String?,
      nationalId: json['nationalId'] as String?,
      nationalIdPic: json['nationalIdPic'] as String?,
      password: json['password'] as String?,
      isAdmin: json['isAdmin'] as bool?,
      isStaff: json['isStaff'] as bool?,
      createdDate: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
    );

Map<String, dynamic> _$$_GuestToJson(_$_Guest instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'gender': instance.gender,
      'career': instance.career,
      'nationalId': instance.nationalId,
      'nationalIdPic': instance.nationalIdPic,
      'password': instance.password,
      'isAdmin': instance.isAdmin,
      'isStaff': instance.isStaff,
      'created_date': instance.createdDate?.toIso8601String(),
    };
