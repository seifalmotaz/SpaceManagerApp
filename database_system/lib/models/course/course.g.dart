// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Course _$$_CourseFromJson(Map<String, dynamic> json) => _$_Course(
      id: json['id'] as int?,
      lecturerId: json['lecturer_id'] as int?,
      totalPrice: (json['total_price'] as num?)?.toDouble(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      startTime: DataCompiler.fromDBDate(json['start_time'] as int?),
      endTime: DataCompiler.fromDBDate(json['end_time'] as int?),
      isExpired: DataCompiler.fromDBool(json['is_expired'] as int?),
    );

Map<String, dynamic> _$$_CourseToJson(_$_Course instance) => <String, dynamic>{
      'id': instance.id,
      'lecturer_id': instance.lecturerId,
      'total_price': instance.totalPrice,
      'name': instance.name,
      'description': instance.description,
      'start_time': DataCompiler.toDBDate(instance.startTime),
      'end_time': DataCompiler.toDBDate(instance.endTime),
      'is_expired': DataCompiler.toDBool(instance.isExpired),
    };

// **************************************************************************
// EngineSQLGenerator
// **************************************************************************

extension CourseFieldsSQL on CourseFields {
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
  static String nativeId = 'course.id';
  static String id = 'id';
// \ // \ End: id // \ // \
// \ // \ Start: lecturerId // \ // \
  static String nativeLecturerId = 'course.lecturer_id';
  static String lecturerId = 'lecturer_id';
// \ // \ End: lecturerId // \ // \
// \ // \ Start: totalPrice // \ // \
  static String nativeTotalPrice = 'course.total_price';
  static String totalPrice = 'total_price';
// \ // \ End: totalPrice // \ // \
// \ // \ Start: name // \ // \
  static String nativeName = 'course.name';
  static String name = 'name';
// \ // \ End: name // \ // \
// \ // \ Start: description // \ // \
  static String nativeDescription = 'course.description';
  static String description = 'description';
// \ // \ End: description // \ // \
// \ // \ Start: startTime // \ // \
  static String nativeStartTime = 'course.start_time';
  static String startTime = 'start_time';
// \ // \ End: startTime // \ // \
// \ // \ Start: endTime // \ // \
  static String nativeEndTime = 'course.end_time';
  static String endTime = 'end_time';
// \ // \ End: endTime // \ // \
// \ // \ Start: isExpired // \ // \
  static String nativeIsExpired = 'course.is_expired';
  static String isExpired = 'is_expired';
// \ // \ End: isExpired // \ // \

  static fromJson(Map<String, dynamic> json) =>
      _$$_CourseFromJson(getStartWithString_('course', json));
}
