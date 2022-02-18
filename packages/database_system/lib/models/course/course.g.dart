// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as int,
      description: json['description'] as String,
      lecturerId: json['lecturer_id'] as int,
      name: json['name'] as String,
      totalPrice: (json['total_price'] as num).toDouble(),
      isDeleted: DataCompiler.fromDBoolNull(json['is_deleted'] as int?),
      createdDate: DataCompiler.fromDBDateNull(json['created_date'] as int?),
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

  writeNotNull('is_deleted', DataCompiler.toDBoolNull(instance.isDeleted));
  writeNotNull('created_date', DataCompiler.toDBDateNull(instance.createdDate));
  return val;
}

// **************************************************************************
// Generator: QuerysGen
// **************************************************************************

class CourseQuery {
  final Database db;
  CourseQuery(this.db);

  Future<int> create({
    required int lecturerId,
    required double totalPrice,
    required String name,
    required String description,
    bool? isDeleted,
    DateTime? createdDate,
  }) async =>
      await db.insert('course', {
        if (lecturerId != null) 'lecturer_id': lecturerId,
        if (totalPrice != null) 'total_price': totalPrice,
        if (name != null) 'name': name,
        if (description != null) 'description': description,
        if (isDeleted != null) 'is_deleted': isDeleted ? 1 : 0,
        if (createdDate != null)
          'created_date':
              (createdDate.millisecondsSinceEpoch / 1000).round() as int,
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
    bool? isDeleted,
    DateTime? createdDate,
  }) async =>
      await db.update(
        'course',
        {
          if (lecturerId != null) 'lecturer_id': lecturerId,
          if (totalPrice != null) 'total_price': totalPrice,
          if (name != null) 'name': name,
          if (description != null) 'description': description,
          if (isDeleted != null) 'is_deleted': isDeleted ? 1 : 0,
          if (createdDate != null)
            'created_date':
                (createdDate.millisecondsSinceEpoch / 1000).round() as int,
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
    bool? isDeleted,
    DateTime? createdDate,
  }) async {
    List<String> searchFields = [];
    if (lecturerId != null) {
      searchFields.add("course.lecturer_id = ?");
    }
    if (totalPrice != null) {
      searchFields.add("course.total_price = ?");
    }
    if (name != null) {
      searchFields.add("course.name = ?");
    }
    if (description != null) {
      searchFields.add("course.description = ?");
    }
    if (isDeleted != null) {
      searchFields.add("course.is_deleted = ?");
    }
    if (createdDate != null) {
      searchFields.add("course.created_date = ?");
    }

    StringBuffer buf = StringBuffer();
    for (int i = 0; i < searchFields.length; i++) {
      if (i == 0) buf.writeln(searchFields[i]);
      if (i != 0) buf.writeln("AND " + searchFields[i]);
    }

    List<Map<String, dynamic>> data = await db.query(
      'course',
      where: '''
          ${buf.toString()}
          ${buf.toString().isNotEmpty ? "AND" : ""} ${CourseTable.sqlFindSchema}
          ''',
      whereArgs: [
        if (lecturerId != null) lecturerId,
        if (totalPrice != null) totalPrice,
        if (name != null) name,
        if (description != null) description,
        if (isDeleted != null) isDeleted ? 1 : 0,
        if (createdDate != null)
          (createdDate.millisecondsSinceEpoch / 1000).round() as int,
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
  static String isDeleted = 'is_deleted';
  static String nativeIsDeleted = 'course.is_deleted';

  /// Field data: field ///
  static String createdDate = 'created_date';
  static String nativeCreatedDate = 'course.created_date';

  static const String sqlSelect = """
    course.id AS course_id,
    course.lecturer_id AS course_lecturer_id,
    course.total_price AS course_total_price,
    course.name AS course_name,
    course.description AS course_description,
    course.is_deleted AS course_is_deleted,
    course.created_date AS course_created_date
  """;

  static const String sqlFindSchema = """
    course.id IS NOT NULL
    AND course.lecturer_id IS NOT NULL
    AND course.total_price IS NOT NULL
    AND course.name IS NOT NULL
    AND course.description IS NOT NULL
  """;

  static const List schemaMap = [
    'id',
    'lecturer_id',
    'total_price',
    'name',
    'description',
    'is_deleted',
    'created_date',
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

  static Course? filterFromJson(Map<String, dynamic> json) =>
      schemaToJson(getStartWithString_('course', json));
}
