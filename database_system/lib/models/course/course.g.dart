// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as int,
      description: json['description'] as String,
      endTime: DataCompiler.fromDBDate(json['end_time'] as int),
      isExpired: DataCompiler.fromDBool(json['is_expired'] as int),
      lecturerId: json['lecturer_id'] as int,
      name: json['name'] as String,
      startTime: DataCompiler.fromDBDate(json['start_time'] as int),
      totalPrice: (json['total_price'] as num).toDouble(),
    );

Map<String, dynamic> _$CourseToJson(Course instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'lecturer_id': instance.lecturerId,
    'total_price': instance.totalPrice,
    'name': instance.name,
    'description': instance.description,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('start_time', DataCompiler.toDBDate(instance.startTime));
  writeNotNull('end_time', DataCompiler.toDBDate(instance.endTime));
  writeNotNull('is_expired', DataCompiler.toDBool(instance.isExpired));
  return val;
}

// **************************************************************************
// Generator: QuerysGen
// **************************************************************************

class CourseQuery {
  final Database db;
  CourseQuery(this.db);

  Future<int> create({
    int? lecturerId,
    double? totalPrice,
    String? name,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
    bool? isExpired,
  }) async =>
      await db.insert('course', {
        if (lecturerId != null) 'lecturer_id': lecturerId,
        if (totalPrice != null) 'total_price': totalPrice,
        if (name != null) 'name': name,
        if (description != null) 'description': description,
        if (startTime != null) 'start_time': startTime,
        if (endTime != null) 'end_time': endTime,
        if (isExpired != null) 'is_expired': isExpired,
      });

  Future<Course> read(int id) async {
    List<Map<String, dynamic>> data = await db.query(
      'course',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Course.fromJson(data.first);
  }

  Future<int> update({
    required int id,
    int? lecturerId,
    double? totalPrice,
    String? name,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
    bool? isExpired,
  }) async =>
      await db.update(
        'course',
        {
          if (lecturerId != null) 'lecturer_id': lecturerId,
          if (totalPrice != null) 'total_price': totalPrice,
          if (name != null) 'name': name,
          if (description != null) 'description': description,
          if (startTime != null) 'start_time': startTime,
          if (endTime != null) 'end_time': endTime,
          if (isExpired != null) 'is_expired': isExpired,
        },
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<int> delete(int id) async => await db.delete(
        'course',
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<List<Course>> find({
    int? lecturerId,
    double? totalPrice,
    String? name,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
    bool? isExpired,
  }) async {
    List<Map<String, dynamic>> data = await db.query(
      'course',
      where: '''
          ${lecturerId == null ? "" : "course.lecturer_id IS NOT NULL"}
          ${totalPrice == null ? "" : "AND course.total_price IS NOT NULL"}
          ${name == null ? "" : "AND course.name IS NOT NULL"}
          ${description == null ? "" : "AND course.description IS NOT NULL"}
          ${startTime == null ? "" : "AND course.start_time IS NOT NULL"}
          ${endTime == null ? "" : "AND course.end_time IS NOT NULL"}
          ${isExpired == null ? "" : "AND course.is_expired IS NOT NULL"}

          AND ${CourseTable.sqlFindSchema}
          ''',
      whereArgs: [
        lecturerId,
        totalPrice,
        name,
        description,
        startTime,
        endTime,
        isExpired,
      ],
    );

    return data.map((e) => Course.fromJson(e)).toList();
  }
}

// **************************************************************************
// Generator: SqlFieldsGen
// **************************************************************************

extension CourseTable on Course {
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
  static String nativeId = 'course.id';

  /// Field data: field ///
  static String lecturerId = 'lecturer_id';
  static String nativeLecturerId = 'course.lecturer_id';

  /// Field data: field ///
  static String totalPrice = 'total_price';
  static String nativeTotalPrice = 'course.total_price';

  /// Field data: field ///
  static String name = 'name';
  static String nativeName = 'course.name';

  /// Field data: field ///
  static String description = 'description';
  static String nativeDescription = 'course.description';

  /// Field data: field ///
  static String startTime = 'start_time';
  static String nativeStartTime = 'course.start_time';

  /// Field data: field ///
  static String endTime = 'end_time';
  static String nativeEndTime = 'course.end_time';

  /// Field data: field ///
  static String isExpired = 'is_expired';
  static String nativeIsExpired = 'course.is_expired';

  static const String sqlSelect = """
    course.id AS course_id,
    course.lecturer_id AS course_lecturer_id,
    course.total_price AS course_total_price,
    course.name AS course_name,
    course.description AS course_description,
    course.start_time AS course_start_time,
    course.end_time AS course_end_time,
    course.is_expired AS course_is_expired,
  """;

  static const String sqlFindSchema = """
    course.id IS NOT NULL
    AND course.lecturer_id IS NOT NULL
    AND course.total_price IS NOT NULL
    AND course.name IS NOT NULL
    AND course.description IS NOT NULL
    AND course.start_time IS NOT NULL
    AND course.end_time IS NOT NULL
    AND course.is_expired IS NOT NULL
  """;

  static const List schemaMap = [
    'id',
    'lecturer_id',
    'total_price',
    'name',
    'description',
    'start_time',
    'end_time',
    'is_expired',
  ];

  static fromJson(Map<String, dynamic> json) =>
      _$CourseFromJson(getStartWithString_('course', json));

  static Course? schemaToJson(Map<String, dynamic> json) {
    bool valid = true;

    for (String i in json.keys) {
      if (!schemaMap.contains(i)) {
        valid = false;
        break;
      }
    }

    if (valid) {
      return _$CourseFromJson(json);
    }
  }
}
