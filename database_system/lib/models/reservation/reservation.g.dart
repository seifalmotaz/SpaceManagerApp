// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseReservation _$CourseReservationFromJson(Map<String, dynamic> json) =>
    CourseReservation(
      courseId: json['course_id'],
      roomId: json['room_id'] as int,
      createdDate: DataCompiler.fromDBDate(json['created_date'] as int),
      guestId: json['guest_id'],
      id: json['id'],
      timeIn: DataCompiler.fromDBDate(json['time_in'] as int),
      timeOut: DataCompiler.fromDBDate(json['time_out'] as int),
      isCancelled: json['is_cancelled'] == null
          ? false
          : DataCompiler.fromDBool(json['is_cancelled'] as int),
    );

Map<String, dynamic> _$CourseReservationToJson(CourseReservation instance) {
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

  writeNotNull('is_cancelled', DataCompiler.toDBool(instance.isCancelled));
  writeNotNull('time_in', DataCompiler.toDBDate(instance.timeIn));
  writeNotNull('time_out', DataCompiler.toDBDate(instance.timeOut));
  writeNotNull('created_date', DataCompiler.toDBDate(instance.createdDate));
  val['room_id'] = instance.roomId;
  return val;
}

GuestReservation _$GuestReservationFromJson(Map<String, dynamic> json) =>
    GuestReservation(
      courseId: json['course_id'],
      paidAmount: (json['paid_amount'] as num).toDouble(),
      createdDate: DataCompiler.fromDBDate(json['created_date'] as int),
      guestId: json['guest_id'],
      id: json['id'],
      timeIn: DataCompiler.fromDBDate(json['time_in'] as int),
      timeOut: DataCompiler.fromDBDate(json['time_out'] as int),
      isCancelled: json['is_cancelled'] == null
          ? false
          : DataCompiler.fromDBool(json['is_cancelled'] as int),
    );

Map<String, dynamic> _$GuestReservationToJson(GuestReservation instance) {
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

  writeNotNull('is_cancelled', DataCompiler.toDBool(instance.isCancelled));
  writeNotNull('time_in', DataCompiler.toDBDate(instance.timeIn));
  writeNotNull('time_out', DataCompiler.toDBDate(instance.timeOut));
  writeNotNull('created_date', DataCompiler.toDBDate(instance.createdDate));
  val['paid_amount'] = instance.paidAmount;
  return val;
}

// **************************************************************************
// Generator: QuerysGen
// **************************************************************************

class CourseReservationQuery {
  final Database db;
  CourseReservationQuery(this.db);

  Future<int> create({
    required int roomId,
    required int guestId,
    required int courseId,
    required bool isCancelled,
    required DateTime timeIn,
    required DateTime timeOut,
    required DateTime createdDate,
  }) async =>
      await db.insert('reservation', {
        if (roomId != null) 'room_id': roomId,
        if (guestId != null) 'guest_id': guestId,
        if (courseId != null) 'course_id': courseId,
        if (isCancelled != null) 'is_cancelled': isCancelled ? 1 : 0,
        if (timeIn != null)
          'time_in': (timeIn.millisecondsSinceEpoch / 1000).round() as int,
        if (timeOut != null)
          'time_out': (timeOut.millisecondsSinceEpoch / 1000).round() as int,
        if (createdDate != null)
          'created_date':
              (createdDate.millisecondsSinceEpoch / 1000).round() as int,
      });

  Future<CourseReservation> read(int id) async {
    List<Map<String, dynamic>> data = await db.query(
      'reservation',
      where: 'id = ?',
      whereArgs: [id],
    );
    return CourseReservation.fromJson(data.first);
  }

  Future<int> update({
    required int id,
    int? roomId,
    int? guestId,
    int? courseId,
    bool? isCancelled,
    DateTime? timeIn,
    DateTime? timeOut,
    DateTime? createdDate,
  }) async =>
      await db.update(
        'reservation',
        {
          if (roomId != null) 'room_id': roomId,
          if (guestId != null) 'guest_id': guestId,
          if (courseId != null) 'course_id': courseId,
          if (isCancelled != null) 'is_cancelled': isCancelled ? 1 : 0,
          if (timeIn != null)
            'time_in': (timeIn.millisecondsSinceEpoch / 1000).round() as int,
          if (timeOut != null)
            'time_out': (timeOut.millisecondsSinceEpoch / 1000).round() as int,
          if (createdDate != null)
            'created_date':
                (createdDate.millisecondsSinceEpoch / 1000).round() as int,
        },
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<int> delete(int id) async => await db.delete(
        'reservation',
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<List<CourseReservation>> find({
    int? roomId,
    int? guestId,
    int? courseId,
    bool? isCancelled,
    DateTime? timeIn,
    DateTime? timeOut,
    DateTime? createdDate,
  }) async {
    List<String> searchFields = [];
    if (roomId != null) {
      searchFields.add("reservation.room_id = ?");
    }
    if (guestId != null) {
      searchFields.add("reservation.guest_id = ?");
    }
    if (courseId != null) {
      searchFields.add("reservation.course_id = ?");
    }
    if (isCancelled != null) {
      searchFields.add("reservation.is_cancelled = ?");
    }
    if (timeIn != null) {
      searchFields.add("reservation.time_in = ?");
    }
    if (timeOut != null) {
      searchFields.add("reservation.time_out = ?");
    }
    if (createdDate != null) {
      searchFields.add("reservation.created_date = ?");
    }

    StringBuffer buf = StringBuffer();
    for (int i = 0; i < searchFields.length; i++) {
      if (i == 0) buf.writeln(searchFields[i]);
      if (i != 0) buf.writeln("AND " + searchFields[i]);
    }

    List<Map<String, dynamic>> data = await db.query(
      'reservation',
      where: '''
          ${buf.toString()}
          ${buf.toString().isNotEmpty ? "AND" : ""} ${CourseReservationTable.sqlFindSchema}
          ''',
      whereArgs: [
        if (roomId != null) roomId,
        if (guestId != null) guestId,
        if (courseId != null) courseId,
        if (isCancelled != null) isCancelled ? 1 : 0,
        if (timeIn != null)
          (timeIn.millisecondsSinceEpoch / 1000).round() as int,
        if (timeOut != null)
          (timeOut.millisecondsSinceEpoch / 1000).round() as int,
        if (createdDate != null)
          (createdDate.millisecondsSinceEpoch / 1000).round() as int,
      ],
    );

    return data.map((e) => CourseReservation.fromJson(e)).toList();
  }
}

class GuestReservationQuery {
  final Database db;
  GuestReservationQuery(this.db);

  Future<int> create({
    required double paidAmount,
    required int guestId,
    required int courseId,
    required bool isCancelled,
    required DateTime timeIn,
    required DateTime timeOut,
    required DateTime createdDate,
  }) async =>
      await db.insert('reservation', {
        if (paidAmount != null) 'paid_amount': paidAmount,
        if (guestId != null) 'guest_id': guestId,
        if (courseId != null) 'course_id': courseId,
        if (isCancelled != null) 'is_cancelled': isCancelled ? 1 : 0,
        if (timeIn != null)
          'time_in': (timeIn.millisecondsSinceEpoch / 1000).round() as int,
        if (timeOut != null)
          'time_out': (timeOut.millisecondsSinceEpoch / 1000).round() as int,
        if (createdDate != null)
          'created_date':
              (createdDate.millisecondsSinceEpoch / 1000).round() as int,
      });

  Future<GuestReservation> read(int id) async {
    List<Map<String, dynamic>> data = await db.query(
      'reservation',
      where: 'id = ?',
      whereArgs: [id],
    );
    return GuestReservation.fromJson(data.first);
  }

  Future<int> update({
    required int id,
    double? paidAmount,
    int? guestId,
    int? courseId,
    bool? isCancelled,
    DateTime? timeIn,
    DateTime? timeOut,
    DateTime? createdDate,
  }) async =>
      await db.update(
        'reservation',
        {
          if (paidAmount != null) 'paid_amount': paidAmount,
          if (guestId != null) 'guest_id': guestId,
          if (courseId != null) 'course_id': courseId,
          if (isCancelled != null) 'is_cancelled': isCancelled ? 1 : 0,
          if (timeIn != null)
            'time_in': (timeIn.millisecondsSinceEpoch / 1000).round() as int,
          if (timeOut != null)
            'time_out': (timeOut.millisecondsSinceEpoch / 1000).round() as int,
          if (createdDate != null)
            'created_date':
                (createdDate.millisecondsSinceEpoch / 1000).round() as int,
        },
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<int> delete(int id) async => await db.delete(
        'reservation',
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<List<GuestReservation>> find({
    double? paidAmount,
    int? guestId,
    int? courseId,
    bool? isCancelled,
    DateTime? timeIn,
    DateTime? timeOut,
    DateTime? createdDate,
  }) async {
    List<String> searchFields = [];
    if (paidAmount != null) {
      searchFields.add("reservation.paid_amount = ?");
    }
    if (guestId != null) {
      searchFields.add("reservation.guest_id = ?");
    }
    if (courseId != null) {
      searchFields.add("reservation.course_id = ?");
    }
    if (isCancelled != null) {
      searchFields.add("reservation.is_cancelled = ?");
    }
    if (timeIn != null) {
      searchFields.add("reservation.time_in = ?");
    }
    if (timeOut != null) {
      searchFields.add("reservation.time_out = ?");
    }
    if (createdDate != null) {
      searchFields.add("reservation.created_date = ?");
    }

    StringBuffer buf = StringBuffer();
    for (int i = 0; i < searchFields.length; i++) {
      if (i == 0) buf.writeln(searchFields[i]);
      if (i != 0) buf.writeln("AND " + searchFields[i]);
    }

    List<Map<String, dynamic>> data = await db.query(
      'reservation',
      where: '''
          ${buf.toString()}
          ${buf.toString().isNotEmpty ? "AND" : ""} ${GuestReservationTable.sqlFindSchema}
          ''',
      whereArgs: [
        if (paidAmount != null) paidAmount,
        if (guestId != null) guestId,
        if (courseId != null) courseId,
        if (isCancelled != null) isCancelled ? 1 : 0,
        if (timeIn != null)
          (timeIn.millisecondsSinceEpoch / 1000).round() as int,
        if (timeOut != null)
          (timeOut.millisecondsSinceEpoch / 1000).round() as int,
        if (createdDate != null)
          (createdDate.millisecondsSinceEpoch / 1000).round() as int,
      ],
    );

    return data.map((e) => GuestReservation.fromJson(e)).toList();
  }
}

// **************************************************************************
// Generator: SqlFieldsGen
// **************************************************************************

extension CourseReservationTable on CourseReservation {
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
  static String roomId = 'room_id';
  static String nativeRoomId = 'reservation.room_id';

  /// Field data: field ///
  static String id = 'id';
  static String nativeId = 'reservation.id';

  /// Field data: field ///
  static String guestId = 'guest_id';
  static String nativeGuestId = 'reservation.guest_id';

  /// Field data: field ///
  static String courseId = 'course_id';
  static String nativeCourseId = 'reservation.course_id';

  /// Field data: field ///
  static String isCancelled = 'is_cancelled';
  static String nativeIsCancelled = 'reservation.is_cancelled';

  /// Field data: field ///
  static String timeIn = 'time_in';
  static String nativeTimeIn = 'reservation.time_in';

  /// Field data: field ///
  static String timeOut = 'time_out';
  static String nativeTimeOut = 'reservation.time_out';

  /// Field data: field ///
  static String createdDate = 'created_date';
  static String nativeCreatedDate = 'reservation.created_date';

  static const String sqlSelect = """
    reservation.room_id AS reservation_room_id,
    reservation.id AS reservation_id,
    reservation.guest_id AS reservation_guest_id,
    reservation.course_id AS reservation_course_id,
    reservation.is_cancelled AS reservation_is_cancelled,
    reservation.time_in AS reservation_time_in,
    reservation.time_out AS reservation_time_out,
    reservation.created_date AS reservation_created_date
  """;

  static const String sqlFindSchema = """
    reservation.room_id IS NOT NULL
    AND reservation.id IS NOT NULL
    AND reservation.guest_id IS NOT NULL
    AND reservation.course_id IS NOT NULL
    AND reservation.is_cancelled IS NOT NULL
    AND reservation.time_in IS NOT NULL
    AND reservation.time_out IS NOT NULL
    AND reservation.created_date IS NOT NULL
  """;

  static const List schemaMap = [
    'room_id',
    'id',
    'guest_id',
    'course_id',
    'is_cancelled',
    'time_in',
    'time_out',
    'created_date',
  ];

  static fromJson(Map<String, dynamic> json) =>
      _$CourseReservationFromJson(getStartWithString_('reservation', json));

  static CourseReservation? schemaToJson(Map<String, dynamic> json) {
    bool valid = true;

    for (String i in json.keys) {
      if (!schemaMap.contains(i)) {
        valid = false;
        break;
      }
    }

    if (valid) {
      return _$CourseReservationFromJson(json);
    }
  }

  static CourseReservation? filterFromJson(Map<String, dynamic> json) =>
      schemaToJson(getStartWithString_('reservation', json));
}

extension GuestReservationTable on GuestReservation {
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
  static String paidAmount = 'paid_amount';
  static String nativePaidAmount = 'reservation.paid_amount';

  /// Field data: field ///
  static String id = 'id';
  static String nativeId = 'reservation.id';

  /// Field data: field ///
  static String guestId = 'guest_id';
  static String nativeGuestId = 'reservation.guest_id';

  /// Field data: field ///
  static String courseId = 'course_id';
  static String nativeCourseId = 'reservation.course_id';

  /// Field data: field ///
  static String isCancelled = 'is_cancelled';
  static String nativeIsCancelled = 'reservation.is_cancelled';

  /// Field data: field ///
  static String timeIn = 'time_in';
  static String nativeTimeIn = 'reservation.time_in';

  /// Field data: field ///
  static String timeOut = 'time_out';
  static String nativeTimeOut = 'reservation.time_out';

  /// Field data: field ///
  static String createdDate = 'created_date';
  static String nativeCreatedDate = 'reservation.created_date';

  static const String sqlSelect = """
    reservation.paid_amount AS reservation_paid_amount,
    reservation.id AS reservation_id,
    reservation.guest_id AS reservation_guest_id,
    reservation.course_id AS reservation_course_id,
    reservation.is_cancelled AS reservation_is_cancelled,
    reservation.time_in AS reservation_time_in,
    reservation.time_out AS reservation_time_out,
    reservation.created_date AS reservation_created_date
  """;

  static const String sqlFindSchema = """
    reservation.paid_amount IS NOT NULL
    AND reservation.id IS NOT NULL
    AND reservation.guest_id IS NOT NULL
    AND reservation.course_id IS NOT NULL
    AND reservation.is_cancelled IS NOT NULL
    AND reservation.time_in IS NOT NULL
    AND reservation.time_out IS NOT NULL
    AND reservation.created_date IS NOT NULL
  """;

  static const List schemaMap = [
    'paid_amount',
    'id',
    'guest_id',
    'course_id',
    'is_cancelled',
    'time_in',
    'time_out',
    'created_date',
  ];

  static fromJson(Map<String, dynamic> json) =>
      _$GuestReservationFromJson(getStartWithString_('reservation', json));

  static GuestReservation? schemaToJson(Map<String, dynamic> json) {
    bool valid = true;

    for (String i in json.keys) {
      if (!schemaMap.contains(i)) {
        valid = false;
        break;
      }
    }

    if (valid) {
      return _$GuestReservationFromJson(json);
    }
  }

  static GuestReservation? filterFromJson(Map<String, dynamic> json) =>
      schemaToJson(getStartWithString_('reservation', json));
}
