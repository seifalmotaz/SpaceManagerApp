// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourseRegistration _$$_CourseRegistrationFromJson(
        Map<String, dynamic> json) =>
    _$_CourseRegistration(
      id: json['id'] as int?,
      guestId: json['guest_id'] as int?,
      courseId: json['course_id'] as int?,
      isPaid: DataCompiler.fromDBool(json['is_paid'] as int?),
      createdDate: DataCompiler.fromDBDate(json['created_date'] as int?),
    );

Map<String, dynamic> _$$_CourseRegistrationToJson(
        _$_CourseRegistration instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guest_id': instance.guestId,
      'course_id': instance.courseId,
      'is_paid': DataCompiler.toDBool(instance.isPaid),
      'created_date': DataCompiler.toDBDate(instance.createdDate),
    };

// **************************************************************************
// EngineSQLGenerator
// **************************************************************************

extension CourseRegistrationFieldsSQL on CourseRegistrationFields {
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
  static String nativeId = 'course_registration.id';
  static String id = 'id';
// \ // \ End: id // \ // \
// \ // \ Start: guestId // \ // \
  static String nativeGuestId = 'course_registration.guest_id';
  static String guestId = 'guest_id';
// \ // \ End: guestId // \ // \
// \ // \ Start: courseId // \ // \
  static String nativeCourseId = 'course_registration.course_id';
  static String courseId = 'course_id';
// \ // \ End: courseId // \ // \
// \ // \ Start: isPaid // \ // \
  static String nativeIsPaid = 'course_registration.is_paid';
  static String isPaid = 'is_paid';
// \ // \ End: isPaid // \ // \
// \ // \ Start: createdDate // \ // \
  static String nativeCreatedDate = 'course_registration.created_date';
  static String createdDate = 'created_date';
// \ // \ End: createdDate // \ // \

  static fromJson(Map<String, dynamic> json) => _$$_CourseRegistrationFromJson(
      getStartWithString_('course_registration', json));
}
