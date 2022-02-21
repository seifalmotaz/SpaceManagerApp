// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseReservation _$CourseReservationFromJson(Map<String, dynamic> json) =>
    CourseReservation(
      courseId: json['course_id'] as int,
      createdDate: DataCompiler.fromDBDateNull(json['created_date'] as int?),
      id: json['id'],
      timeIn: DataCompiler.fromDBDate(json['time_in'] as int),
      timeOut: DataCompiler.fromDBDate(json['time_out'] as int),
      roomId: json['room_id'],
      tag: json['tag'],
      isCancelled: json['is_cancelled'] == null
          ? false
          : DataCompiler.fromDBool(json['is_cancelled'] as int),
      customPaid: json['custom_paid'] == null
          ? false
          : DataCompiler.fromDBoolNull(json['custom_paid'] as int?),
      capacity: json['capacity'],
    );

Map<String, dynamic> _$CourseReservationToJson(CourseReservation instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'room_id': instance.roomId,
    'tag': instance.tag,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('capacity', instance.capacity);
  writeNotNull('is_cancelled', DataCompiler.toDBool(instance.isCancelled));
  writeNotNull('time_in', DataCompiler.toDBDate(instance.timeIn));
  writeNotNull('time_out', DataCompiler.toDBDate(instance.timeOut));
  writeNotNull('created_date', DataCompiler.toDBDateNull(instance.createdDate));
  writeNotNull('custom_paid', DataCompiler.toDBoolNull(instance.customPaid));
  val['course_id'] = instance.courseId;
  return val;
}

GuestReservation _$GuestReservationFromJson(Map<String, dynamic> json) =>
    GuestReservation(
      paidAmount: (json['paid_amount'] as num).toDouble(),
      guestId: json['guest_id'] as int,
      createdDate: DataCompiler.fromDBDateNull(json['created_date'] as int?),
      extraHoursPrice: (json['extra_hours_price'] as num?)?.toDouble(),
      id: json['id'],
      timeIn: DataCompiler.fromDBDate(json['time_in'] as int),
      timeOut: DataCompiler.fromDBDate(json['time_out'] as int),
      roomId: json['room_id'],
      tag: json['tag'],
      isCancelled: DataCompiler.fromDBool(json['is_cancelled'] as int),
      customPaid: DataCompiler.fromDBoolNull(json['custom_paid'] as int?),
      capacity: json['capacity'],
    );

Map<String, dynamic> _$GuestReservationToJson(GuestReservation instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'room_id': instance.roomId,
    'tag': instance.tag,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('capacity', instance.capacity);
  writeNotNull('is_cancelled', DataCompiler.toDBool(instance.isCancelled));
  writeNotNull('time_in', DataCompiler.toDBDate(instance.timeIn));
  writeNotNull('time_out', DataCompiler.toDBDate(instance.timeOut));
  writeNotNull('created_date', DataCompiler.toDBDateNull(instance.createdDate));
  writeNotNull('custom_paid', DataCompiler.toDBoolNull(instance.customPaid));
  val['paid_amount'] = instance.paidAmount;
  val['guest_id'] = instance.guestId;
  writeNotNull('extra_hours_price', instance.extraHoursPrice);
  return val;
}

// **************************************************************************
// Generator: QuerysGen
// **************************************************************************

class CourseReservationQuery {
  final Database db;
  CourseReservationQuery(this.db);

  Future<int> create({
    required int courseId,
    required int roomId,
    required String tag,
    int? capacity,
    bool? isCancelled,
    required DateTime timeIn,
    required DateTime timeOut,
    DateTime? createdDate,
    bool? customPaid,
  }) async =>
      await db.insert('reservation', {
        if (courseId != null) 'course_id': courseId,
        if (roomId != null) 'room_id': roomId,
        if (tag != null) 'tag': tag,
        if (capacity != null) 'capacity': capacity,
        if (isCancelled != null) 'is_cancelled': isCancelled ? 1 : 0,
        if (timeIn != null)
          'time_in': (timeIn.millisecondsSinceEpoch / 1000).round() as int,
        if (timeOut != null)
          'time_out': (timeOut.millisecondsSinceEpoch / 1000).round() as int,
        if (createdDate != null)
          'created_date':
              (createdDate.millisecondsSinceEpoch / 1000).round() as int,
        if (customPaid != null) 'custom_paid': customPaid ? 1 : 0,
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
    int? courseId,
    int? roomId,
    String? tag,
    int? capacity,
    bool? isCancelled,
    DateTime? timeIn,
    DateTime? timeOut,
    DateTime? createdDate,
    bool? customPaid,
  }) async =>
      await db.update(
        'reservation',
        {
          if (courseId != null) 'course_id': courseId,
          if (roomId != null) 'room_id': roomId,
          if (tag != null) 'tag': tag,
          if (capacity != null) 'capacity': capacity,
          if (isCancelled != null) 'is_cancelled': isCancelled ? 1 : 0,
          if (timeIn != null)
            'time_in': (timeIn.millisecondsSinceEpoch / 1000).round() as int,
          if (timeOut != null)
            'time_out': (timeOut.millisecondsSinceEpoch / 1000).round() as int,
          if (createdDate != null)
            'created_date':
                (createdDate.millisecondsSinceEpoch / 1000).round() as int,
          if (customPaid != null) 'custom_paid': customPaid ? 1 : 0,
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
    int? courseId,
    int? roomId,
    String? tag,
    int? capacity,
    bool? isCancelled,
    DateTime? timeIn,
    DateTime? timeOut,
    DateTime? createdDate,
    bool? customPaid,
  }) async {
    List<String> searchFields = [];
    if (courseId != null) {
      searchFields.add("reservation.course_id = ?");
    }
    if (roomId != null) {
      searchFields.add("reservation.room_id = ?");
    }
    if (tag != null) {
      searchFields.add("reservation.tag = ?");
    }
    if (capacity != null) {
      searchFields.add("reservation.capacity = ?");
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
    if (customPaid != null) {
      searchFields.add("reservation.custom_paid = ?");
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
        if (courseId != null) courseId,
        if (roomId != null) roomId,
        if (tag != null) tag,
        if (capacity != null) capacity,
        if (isCancelled != null) isCancelled ? 1 : 0,
        if (timeIn != null)
          (timeIn.millisecondsSinceEpoch / 1000).round() as int,
        if (timeOut != null)
          (timeOut.millisecondsSinceEpoch / 1000).round() as int,
        if (createdDate != null)
          (createdDate.millisecondsSinceEpoch / 1000).round() as int,
        if (customPaid != null) customPaid ? 1 : 0,
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
    double? extraHoursPrice,
    required int roomId,
    required String tag,
    int? capacity,
    bool? isCancelled,
    required DateTime timeIn,
    required DateTime timeOut,
    DateTime? createdDate,
    bool? customPaid,
  }) async =>
      await db.insert('reservation', {
        if (paidAmount != null) 'paid_amount': paidAmount,
        if (guestId != null) 'guest_id': guestId,
        if (extraHoursPrice != null) 'extra_hours_price': extraHoursPrice,
        if (roomId != null) 'room_id': roomId,
        if (tag != null) 'tag': tag,
        if (capacity != null) 'capacity': capacity,
        if (isCancelled != null) 'is_cancelled': isCancelled ? 1 : 0,
        if (timeIn != null)
          'time_in': (timeIn.millisecondsSinceEpoch / 1000).round() as int,
        if (timeOut != null)
          'time_out': (timeOut.millisecondsSinceEpoch / 1000).round() as int,
        if (createdDate != null)
          'created_date':
              (createdDate.millisecondsSinceEpoch / 1000).round() as int,
        if (customPaid != null) 'custom_paid': customPaid ? 1 : 0,
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
    double? extraHoursPrice,
    int? roomId,
    String? tag,
    int? capacity,
    bool? isCancelled,
    DateTime? timeIn,
    DateTime? timeOut,
    DateTime? createdDate,
    bool? customPaid,
  }) async =>
      await db.update(
        'reservation',
        {
          if (paidAmount != null) 'paid_amount': paidAmount,
          if (guestId != null) 'guest_id': guestId,
          if (extraHoursPrice != null) 'extra_hours_price': extraHoursPrice,
          if (roomId != null) 'room_id': roomId,
          if (tag != null) 'tag': tag,
          if (capacity != null) 'capacity': capacity,
          if (isCancelled != null) 'is_cancelled': isCancelled ? 1 : 0,
          if (timeIn != null)
            'time_in': (timeIn.millisecondsSinceEpoch / 1000).round() as int,
          if (timeOut != null)
            'time_out': (timeOut.millisecondsSinceEpoch / 1000).round() as int,
          if (createdDate != null)
            'created_date':
                (createdDate.millisecondsSinceEpoch / 1000).round() as int,
          if (customPaid != null) 'custom_paid': customPaid ? 1 : 0,
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
    double? extraHoursPrice,
    int? roomId,
    String? tag,
    int? capacity,
    bool? isCancelled,
    DateTime? timeIn,
    DateTime? timeOut,
    DateTime? createdDate,
    bool? customPaid,
  }) async {
    List<String> searchFields = [];
    if (paidAmount != null) {
      searchFields.add("reservation.paid_amount = ?");
    }
    if (guestId != null) {
      searchFields.add("reservation.guest_id = ?");
    }
    if (extraHoursPrice != null) {
      searchFields.add("reservation.extra_hours_price = ?");
    }
    if (roomId != null) {
      searchFields.add("reservation.room_id = ?");
    }
    if (tag != null) {
      searchFields.add("reservation.tag = ?");
    }
    if (capacity != null) {
      searchFields.add("reservation.capacity = ?");
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
    if (customPaid != null) {
      searchFields.add("reservation.custom_paid = ?");
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
        if (extraHoursPrice != null) extraHoursPrice,
        if (roomId != null) roomId,
        if (tag != null) tag,
        if (capacity != null) capacity,
        if (isCancelled != null) isCancelled ? 1 : 0,
        if (timeIn != null)
          (timeIn.millisecondsSinceEpoch / 1000).round() as int,
        if (timeOut != null)
          (timeOut.millisecondsSinceEpoch / 1000).round() as int,
        if (createdDate != null)
          (createdDate.millisecondsSinceEpoch / 1000).round() as int,
        if (customPaid != null) customPaid ? 1 : 0,
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
  static String courseId = 'course_id';
  static String nativeCourseId = 'reservation.course_id';

  /// Field data: field ///
  static String id = 'id';
  static String nativeId = 'reservation.id';

  /// Field data: field ///
  static String roomId = 'room_id';
  static String nativeRoomId = 'reservation.room_id';

  /// Field data: field ///
  static String tag = 'tag';
  static String nativeTag = 'reservation.tag';

  /// Field data: field ///
  static String capacity = 'capacity';
  static String nativeCapacity = 'reservation.capacity';

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

  /// Field data: field ///
  static String customPaid = 'custom_paid';
  static String nativeCustomPaid = 'reservation.custom_paid';

  static const String sqlSelect = """
    reservation.course_id AS reservation_course_id,
    reservation.id AS reservation_id,
    reservation.room_id AS reservation_room_id,
    reservation.tag AS reservation_tag,
    reservation.capacity AS reservation_capacity,
    reservation.is_cancelled AS reservation_is_cancelled,
    reservation.time_in AS reservation_time_in,
    reservation.time_out AS reservation_time_out,
    reservation.created_date AS reservation_created_date,
    reservation.custom_paid AS reservation_custom_paid
  """;

  static const String sqlFindSchema = """
    reservation.course_id IS NOT NULL
    AND reservation.id IS NOT NULL
    AND reservation.room_id IS NOT NULL
    AND reservation.tag IS NOT NULL
    AND reservation.is_cancelled IS NOT NULL
    AND reservation.time_in IS NOT NULL
    AND reservation.time_out IS NOT NULL
  """;

  static const List schemaMap = [
    'course_id',
    'id',
    'room_id',
    'tag',
    'capacity',
    'is_cancelled',
    'time_in',
    'time_out',
    'created_date',
    'custom_paid',
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
  static String guestId = 'guest_id';
  static String nativeGuestId = 'reservation.guest_id';

  /// Field data: field ///
  static String extraHoursPrice = 'extra_hours_price';
  static String nativeExtraHoursPrice = 'reservation.extra_hours_price';

  /// Field data: field ///
  static String id = 'id';
  static String nativeId = 'reservation.id';

  /// Field data: field ///
  static String roomId = 'room_id';
  static String nativeRoomId = 'reservation.room_id';

  /// Field data: field ///
  static String tag = 'tag';
  static String nativeTag = 'reservation.tag';

  /// Field data: field ///
  static String capacity = 'capacity';
  static String nativeCapacity = 'reservation.capacity';

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

  /// Field data: field ///
  static String customPaid = 'custom_paid';
  static String nativeCustomPaid = 'reservation.custom_paid';

  static const String sqlSelect = """
    reservation.paid_amount AS reservation_paid_amount,
    reservation.guest_id AS reservation_guest_id,
    reservation.extra_hours_price AS reservation_extra_hours_price,
    reservation.id AS reservation_id,
    reservation.room_id AS reservation_room_id,
    reservation.tag AS reservation_tag,
    reservation.capacity AS reservation_capacity,
    reservation.is_cancelled AS reservation_is_cancelled,
    reservation.time_in AS reservation_time_in,
    reservation.time_out AS reservation_time_out,
    reservation.created_date AS reservation_created_date,
    reservation.custom_paid AS reservation_custom_paid
  """;

  static const String sqlFindSchema = """
    reservation.paid_amount IS NOT NULL
    AND reservation.guest_id IS NOT NULL
    AND reservation.id IS NOT NULL
    AND reservation.room_id IS NOT NULL
    AND reservation.tag IS NOT NULL
    AND reservation.is_cancelled IS NOT NULL
    AND reservation.time_in IS NOT NULL
    AND reservation.time_out IS NOT NULL
  """;

  static const List schemaMap = [
    'paid_amount',
    'guest_id',
    'extra_hours_price',
    'id',
    'room_id',
    'tag',
    'capacity',
    'is_cancelled',
    'time_in',
    'time_out',
    'created_date',
    'custom_paid',
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
