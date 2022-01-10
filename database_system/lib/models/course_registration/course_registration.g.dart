// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseRegistration _$CourseRegistrationFromJson(Map<String, dynamic> json) =>
    CourseRegistration(
      courseId: json['course_id'] as int,
      createdDate: DataCompiler.fromDBDate(json['created_date'] as int),
      guestId: json['guest_id'] as int,
      id: json['id'] as int,
      isPaid: DataCompiler.fromDBool(json['is_paid'] as int),
    );

Map<String, dynamic> _$CourseRegistrationToJson(CourseRegistration instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guest_id': instance.guestId,
      'course_id': instance.courseId,
      'is_paid': DataCompiler.toDBool(instance.isPaid),
      'created_date': DataCompiler.toDBDate(instance.createdDate),
    };

// **************************************************************************
// Generator: QuerysGen
// **************************************************************************

// hello

// **************************************************************************
// Generator: SqlFieldsGen
// **************************************************************************

extension CourseRegistrationTable on CourseRegistration {
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
  static String nativeId = 'course_registration.id';

  /// Field data: field ///
  static String guestId = 'guest_id';
  static String nativeGuestId = 'course_registration.guest_id';

  /// Field data: field ///
  static String courseId = 'course_id';
  static String nativeCourseId = 'course_registration.course_id';

  /// Field data: field ///
  static String isPaid = 'is_paid';
  static String nativeIsPaid = 'course_registration.is_paid';

  /// Field data: field ///
  static String createdDate = 'created_date';
  static String nativeCreatedDate = 'course_registration.created_date';

  static const String sqlSelect = """
    course_registration.id AS course_registration_id,
    course_registration.guest_id AS course_registration_guest_id,
    course_registration.course_id AS course_registration_course_id,
    course_registration.is_paid AS course_registration_is_paid,
    course_registration.created_date AS course_registration_created_date,
  """;

  static fromJson(Map<String, dynamic> json) => _$CourseRegistrationFromJson(
      getStartWithString_('course_registration', json));
}
