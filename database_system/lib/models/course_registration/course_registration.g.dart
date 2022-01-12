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

Map<String, dynamic> _$CourseRegistrationToJson(CourseRegistration instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'guest_id': instance.guestId,
    'course_id': instance.courseId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('is_paid', DataCompiler.toDBool(instance.isPaid));
  writeNotNull('created_date', DataCompiler.toDBDate(instance.createdDate));
  return val;
}

// **************************************************************************
// Generator: QuerysGen
// **************************************************************************

class CourseRegistrationQuery {
  final Database db;
  CourseRegistrationQuery(this.db);

  Future<int> create({
    int? guestId,
    int? courseId,
    bool? isPaid,
    DateTime? createdDate,
  }) async =>
      await db.insert('course_registration', {
        if (guestId != null) 'guest_id': guestId,
        if (courseId != null) 'course_id': courseId,
        if (isPaid != null) 'is_paid': isPaid,
        if (createdDate != null) 'created_date': createdDate,
      });

  Future<CourseRegistration> read(int id) async {
    List<Map<String, dynamic>> data = await db.query(
      'course_registration',
      where: 'id = ?',
      whereArgs: [id],
    );
    return CourseRegistration.fromJson(data.first);
  }

  Future<int> update({
    required int id,
    int? guestId,
    int? courseId,
    bool? isPaid,
    DateTime? createdDate,
  }) async =>
      await db.update(
        'course_registration',
        {
          if (guestId != null) 'guest_id': guestId,
          if (courseId != null) 'course_id': courseId,
          if (isPaid != null) 'is_paid': isPaid,
          if (createdDate != null) 'created_date': createdDate,
        },
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<int> delete(int id) async => await db.delete(
        'course_registration',
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<List<CourseRegistration>> find({
    int? guestId,
    int? courseId,
    bool? isPaid,
    DateTime? createdDate,
  }) async {
    List<Map<String, dynamic>> data = await db.query(
      'course_registration',
      where: '''
          ${guestId == null ? "" : "course_registration.guest_id IS NOT NULL"}
          ${courseId == null ? "" : "AND course_registration.course_id IS NOT NULL"}
          ${isPaid == null ? "" : "AND course_registration.is_paid IS NOT NULL"}
          ${createdDate == null ? "" : "AND course_registration.created_date IS NOT NULL"}

          AND ${CourseRegistrationTable.sqlFindSchema}
          ''',
      whereArgs: [
        guestId,
        courseId,
        isPaid,
        createdDate,
      ],
    );

    return data.map((e) => CourseRegistration.fromJson(e)).toList();
  }
}

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

  static const String sqlFindSchema = """
    course_registration.id IS NOT NULL
    AND course_registration.guest_id IS NOT NULL
    AND course_registration.course_id IS NOT NULL
    AND course_registration.is_paid IS NOT NULL
    AND course_registration.created_date IS NOT NULL
  """;

  static const List schemaMap = [
    'id',
    'guest_id',
    'course_id',
    'is_paid',
    'created_date',
  ];

  static fromJson(Map<String, dynamic> json) => _$CourseRegistrationFromJson(
      getStartWithString_('course_registration', json));

  static CourseRegistration? schemaToJson(Map<String, dynamic> json) {
    bool valid = true;

    for (String i in json.keys) {
      if (!schemaMap.contains(i)) {
        valid = false;
        break;
      }
    }

    if (valid) {
      return _$CourseRegistrationFromJson(json);
    }
  }
}
