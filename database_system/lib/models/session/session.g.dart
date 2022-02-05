// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffSession _$StaffSessionFromJson(Map<String, dynamic> json) => StaffSession(
      guestId: json['guest_id'] as int,
      id: json['id'],
      timeIn: DataCompiler.fromDBDate(json['time_in'] as int),
      timeOut: DataCompiler.fromDBDateNull(json['time_out'] as int?),
    );

Map<String, dynamic> _$StaffSessionToJson(StaffSession instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('time_in', DataCompiler.toDBDate(instance.timeIn));
  writeNotNull('time_out', DataCompiler.toDBDateNull(instance.timeOut));
  val['guest_id'] = instance.guestId;
  return val;
}

GuestSession _$GuestSessionFromJson(Map<String, dynamic> json) => GuestSession(
      guestCount: json['guest_count'] as int,
      paidAmount: (json['paid_amount'] as num?)?.toDouble(),
      guestId: json['guest_id'] as int,
      customPaid: DataCompiler.fromDBool(json['custom_paid'] as int),
      id: json['id'],
      timeIn: DataCompiler.fromDBDate(json['time_in'] as int),
      timeOut: DataCompiler.fromDBDateNull(json['time_out'] as int?),
      priceId: json['price_id'] as int?,
    );

Map<String, dynamic> _$GuestSessionToJson(GuestSession instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('time_in', DataCompiler.toDBDate(instance.timeIn));
  writeNotNull('time_out', DataCompiler.toDBDateNull(instance.timeOut));
  val['guest_count'] = instance.guestCount;
  writeNotNull('price_id', instance.priceId);
  writeNotNull('paid_amount', instance.paidAmount);
  val['guest_id'] = instance.guestId;
  writeNotNull('custom_paid', DataCompiler.toDBool(instance.customPaid));
  return val;
}

RoomSession _$RoomSessionFromJson(Map<String, dynamic> json) => RoomSession(
      paidAmount: (json['paid_amount'] as num?)?.toDouble(),
      guestId: json['guest_id'] as int,
      roomId: json['room_id'] as int,
      id: json['id'],
      timeIn: DataCompiler.fromDBDate(json['time_in'] as int),
      timeOut: DataCompiler.fromDBDateNull(json['time_out'] as int?),
      customPaid: DataCompiler.fromDBool(json['custom_paid'] as int),
      reservationId: json['reservation_id'] as int?,
    );

Map<String, dynamic> _$RoomSessionToJson(RoomSession instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('time_in', DataCompiler.toDBDate(instance.timeIn));
  writeNotNull('time_out', DataCompiler.toDBDateNull(instance.timeOut));
  val['room_id'] = instance.roomId;
  writeNotNull('paid_amount', instance.paidAmount);
  val['guest_id'] = instance.guestId;
  writeNotNull('reservation_id', instance.reservationId);
  writeNotNull('custom_paid', DataCompiler.toDBool(instance.customPaid));
  return val;
}

CourseSession _$CourseSessionFromJson(Map<String, dynamic> json) =>
    CourseSession(
      roomId: json['room_id'] as int,
      courseId: json['course_id'] as int,
      reservationId: json['reservation_id'] as int,
      id: json['id'],
      timeIn: DataCompiler.fromDBDate(json['time_in'] as int),
      timeOut: DataCompiler.fromDBDateNull(json['time_out'] as int?),
    );

Map<String, dynamic> _$CourseSessionToJson(CourseSession instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('time_in', DataCompiler.toDBDate(instance.timeIn));
  writeNotNull('time_out', DataCompiler.toDBDateNull(instance.timeOut));
  val['room_id'] = instance.roomId;
  val['course_id'] = instance.courseId;
  val['reservation_id'] = instance.reservationId;
  return val;
}

// **************************************************************************
// Generator: QuerysGen
// **************************************************************************

class StaffSessionQuery {
  final Database db;
  StaffSessionQuery(this.db);

  Future<int> create({
    required int guestId,
    DateTime? timeIn,
    DateTime? timeOut,
  }) async =>
      await db.insert('session', {
        if (guestId != null) 'guest_id': guestId,
        if (timeIn != null)
          'time_in': (timeIn.millisecondsSinceEpoch / 1000).round() as int,
        if (timeOut != null)
          'time_out': (timeOut.millisecondsSinceEpoch / 1000).round() as int,
      });

  Future<StaffSession> read(int id) async {
    List<Map<String, dynamic>> data = await db.query(
      'session',
      where: 'id = ?',
      whereArgs: [id],
    );
    return StaffSession.fromJson(data.first);
  }

  Future<int> update({
    required int id,
    int? guestId,
    DateTime? timeIn,
    DateTime? timeOut,
  }) async =>
      await db.update(
        'session',
        {
          if (guestId != null) 'guest_id': guestId,
          if (timeIn != null)
            'time_in': (timeIn.millisecondsSinceEpoch / 1000).round() as int,
          if (timeOut != null)
            'time_out': (timeOut.millisecondsSinceEpoch / 1000).round() as int,
        },
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<int> delete(int id) async => await db.delete(
        'session',
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<List<StaffSession>> find({
    int? guestId,
    DateTime? timeIn,
    DateTime? timeOut,
  }) async {
    List<String> searchFields = [];
    if (guestId != null) {
      searchFields.add("session.guest_id = ?");
    }
    if (timeIn != null) {
      searchFields.add("session.time_in = ?");
    }
    if (timeOut != null) {
      searchFields.add("session.time_out = ?");
    }

    StringBuffer buf = StringBuffer();
    for (int i = 0; i < searchFields.length; i++) {
      if (i == 0) buf.writeln(searchFields[i]);
      if (i != 0) buf.writeln("AND " + searchFields[i]);
    }

    List<Map<String, dynamic>> data = await db.query(
      'session',
      where: '''
          ${buf.toString()}
          ${buf.toString().isNotEmpty ? "AND" : ""} ${StaffSessionTable.sqlFindSchema}
          ''',
      whereArgs: [
        if (guestId != null) guestId,
        if (timeIn != null)
          (timeIn.millisecondsSinceEpoch / 1000).round() as int,
        if (timeOut != null)
          (timeOut.millisecondsSinceEpoch / 1000).round() as int,
      ],
    );

    return data.map((e) => StaffSession.fromJson(e)).toList();
  }
}

class GuestSessionQuery {
  final Database db;
  GuestSessionQuery(this.db);

  Future<int> create({
    required int guestCount,
    int? priceId,
    double? paidAmount,
    required int guestId,
    required bool customPaid,
    DateTime? timeIn,
    DateTime? timeOut,
  }) async =>
      await db.insert('session', {
        if (guestCount != null) 'guest_count': guestCount,
        if (priceId != null) 'price_id': priceId,
        if (paidAmount != null) 'paid_amount': paidAmount,
        if (guestId != null) 'guest_id': guestId,
        if (customPaid != null) 'custom_paid': customPaid ? 1 : 0,
        if (timeIn != null)
          'time_in': (timeIn.millisecondsSinceEpoch / 1000).round() as int,
        if (timeOut != null)
          'time_out': (timeOut.millisecondsSinceEpoch / 1000).round() as int,
      });

  Future<GuestSession> read(int id) async {
    List<Map<String, dynamic>> data = await db.query(
      'session',
      where: 'id = ?',
      whereArgs: [id],
    );
    return GuestSession.fromJson(data.first);
  }

  Future<int> update({
    required int id,
    int? guestCount,
    int? priceId,
    double? paidAmount,
    int? guestId,
    bool? customPaid,
    DateTime? timeIn,
    DateTime? timeOut,
  }) async =>
      await db.update(
        'session',
        {
          if (guestCount != null) 'guest_count': guestCount,
          if (priceId != null) 'price_id': priceId,
          if (paidAmount != null) 'paid_amount': paidAmount,
          if (guestId != null) 'guest_id': guestId,
          if (customPaid != null) 'custom_paid': customPaid ? 1 : 0,
          if (timeIn != null)
            'time_in': (timeIn.millisecondsSinceEpoch / 1000).round() as int,
          if (timeOut != null)
            'time_out': (timeOut.millisecondsSinceEpoch / 1000).round() as int,
        },
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<int> delete(int id) async => await db.delete(
        'session',
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<List<GuestSession>> find({
    int? guestCount,
    int? priceId,
    double? paidAmount,
    int? guestId,
    bool? customPaid,
    DateTime? timeIn,
    DateTime? timeOut,
  }) async {
    List<String> searchFields = [];
    if (guestCount != null) {
      searchFields.add("session.guest_count = ?");
    }
    if (priceId != null) {
      searchFields.add("session.price_id = ?");
    }
    if (paidAmount != null) {
      searchFields.add("session.paid_amount = ?");
    }
    if (guestId != null) {
      searchFields.add("session.guest_id = ?");
    }
    if (customPaid != null) {
      searchFields.add("session.custom_paid = ?");
    }
    if (timeIn != null) {
      searchFields.add("session.time_in = ?");
    }
    if (timeOut != null) {
      searchFields.add("session.time_out = ?");
    }

    StringBuffer buf = StringBuffer();
    for (int i = 0; i < searchFields.length; i++) {
      if (i == 0) buf.writeln(searchFields[i]);
      if (i != 0) buf.writeln("AND " + searchFields[i]);
    }

    List<Map<String, dynamic>> data = await db.query(
      'session',
      where: '''
          ${buf.toString()}
          ${buf.toString().isNotEmpty ? "AND" : ""} ${GuestSessionTable.sqlFindSchema}
          ''',
      whereArgs: [
        if (guestCount != null) guestCount,
        if (priceId != null) priceId,
        if (paidAmount != null) paidAmount,
        if (guestId != null) guestId,
        if (customPaid != null) customPaid ? 1 : 0,
        if (timeIn != null)
          (timeIn.millisecondsSinceEpoch / 1000).round() as int,
        if (timeOut != null)
          (timeOut.millisecondsSinceEpoch / 1000).round() as int,
      ],
    );

    return data.map((e) => GuestSession.fromJson(e)).toList();
  }
}

class RoomSessionQuery {
  final Database db;
  RoomSessionQuery(this.db);

  Future<int> create({
    required int roomId,
    double? paidAmount,
    required int guestId,
    int? reservationId,
    bool? customPaid,
    DateTime? timeIn,
    DateTime? timeOut,
  }) async =>
      await db.insert('session', {
        if (roomId != null) 'room_id': roomId,
        if (paidAmount != null) 'paid_amount': paidAmount,
        if (guestId != null) 'guest_id': guestId,
        if (reservationId != null) 'reservation_id': reservationId,
        if (customPaid != null) 'custom_paid': customPaid ? 1 : 0,
        if (timeIn != null)
          'time_in': (timeIn.millisecondsSinceEpoch / 1000).round() as int,
        if (timeOut != null)
          'time_out': (timeOut.millisecondsSinceEpoch / 1000).round() as int,
      });

  Future<RoomSession> read(int id) async {
    List<Map<String, dynamic>> data = await db.query(
      'session',
      where: 'id = ?',
      whereArgs: [id],
    );
    return RoomSession.fromJson(data.first);
  }

  Future<int> update({
    required int id,
    int? roomId,
    double? paidAmount,
    int? guestId,
    int? reservationId,
    bool? customPaid,
    DateTime? timeIn,
    DateTime? timeOut,
  }) async =>
      await db.update(
        'session',
        {
          if (roomId != null) 'room_id': roomId,
          if (paidAmount != null) 'paid_amount': paidAmount,
          if (guestId != null) 'guest_id': guestId,
          if (reservationId != null) 'reservation_id': reservationId,
          if (customPaid != null) 'custom_paid': customPaid ? 1 : 0,
          if (timeIn != null)
            'time_in': (timeIn.millisecondsSinceEpoch / 1000).round() as int,
          if (timeOut != null)
            'time_out': (timeOut.millisecondsSinceEpoch / 1000).round() as int,
        },
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<int> delete(int id) async => await db.delete(
        'session',
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<List<RoomSession>> find({
    int? roomId,
    double? paidAmount,
    int? guestId,
    int? reservationId,
    bool? customPaid,
    DateTime? timeIn,
    DateTime? timeOut,
  }) async {
    List<String> searchFields = [];
    if (roomId != null) {
      searchFields.add("session.room_id = ?");
    }
    if (paidAmount != null) {
      searchFields.add("session.paid_amount = ?");
    }
    if (guestId != null) {
      searchFields.add("session.guest_id = ?");
    }
    if (reservationId != null) {
      searchFields.add("session.reservation_id = ?");
    }
    if (customPaid != null) {
      searchFields.add("session.custom_paid = ?");
    }
    if (timeIn != null) {
      searchFields.add("session.time_in = ?");
    }
    if (timeOut != null) {
      searchFields.add("session.time_out = ?");
    }

    StringBuffer buf = StringBuffer();
    for (int i = 0; i < searchFields.length; i++) {
      if (i == 0) buf.writeln(searchFields[i]);
      if (i != 0) buf.writeln("AND " + searchFields[i]);
    }

    List<Map<String, dynamic>> data = await db.query(
      'session',
      where: '''
          ${buf.toString()}
          ${buf.toString().isNotEmpty ? "AND" : ""} ${RoomSessionTable.sqlFindSchema}
          ''',
      whereArgs: [
        if (roomId != null) roomId,
        if (paidAmount != null) paidAmount,
        if (guestId != null) guestId,
        if (reservationId != null) reservationId,
        if (customPaid != null) customPaid ? 1 : 0,
        if (timeIn != null)
          (timeIn.millisecondsSinceEpoch / 1000).round() as int,
        if (timeOut != null)
          (timeOut.millisecondsSinceEpoch / 1000).round() as int,
      ],
    );

    return data.map((e) => RoomSession.fromJson(e)).toList();
  }
}

class CourseSessionQuery {
  final Database db;
  CourseSessionQuery(this.db);

  Future<int> create({
    required int roomId,
    required int courseId,
    required int reservationId,
    DateTime? timeIn,
    DateTime? timeOut,
  }) async =>
      await db.insert('session', {
        if (roomId != null) 'room_id': roomId,
        if (courseId != null) 'course_id': courseId,
        if (reservationId != null) 'reservation_id': reservationId,
        if (timeIn != null)
          'time_in': (timeIn.millisecondsSinceEpoch / 1000).round() as int,
        if (timeOut != null)
          'time_out': (timeOut.millisecondsSinceEpoch / 1000).round() as int,
      });

  Future<CourseSession> read(int id) async {
    List<Map<String, dynamic>> data = await db.query(
      'session',
      where: 'id = ?',
      whereArgs: [id],
    );
    return CourseSession.fromJson(data.first);
  }

  Future<int> update({
    required int id,
    int? roomId,
    int? courseId,
    int? reservationId,
    DateTime? timeIn,
    DateTime? timeOut,
  }) async =>
      await db.update(
        'session',
        {
          if (roomId != null) 'room_id': roomId,
          if (courseId != null) 'course_id': courseId,
          if (reservationId != null) 'reservation_id': reservationId,
          if (timeIn != null)
            'time_in': (timeIn.millisecondsSinceEpoch / 1000).round() as int,
          if (timeOut != null)
            'time_out': (timeOut.millisecondsSinceEpoch / 1000).round() as int,
        },
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<int> delete(int id) async => await db.delete(
        'session',
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<List<CourseSession>> find({
    int? roomId,
    int? courseId,
    int? reservationId,
    DateTime? timeIn,
    DateTime? timeOut,
  }) async {
    List<String> searchFields = [];
    if (roomId != null) {
      searchFields.add("session.room_id = ?");
    }
    if (courseId != null) {
      searchFields.add("session.course_id = ?");
    }
    if (reservationId != null) {
      searchFields.add("session.reservation_id = ?");
    }
    if (timeIn != null) {
      searchFields.add("session.time_in = ?");
    }
    if (timeOut != null) {
      searchFields.add("session.time_out = ?");
    }

    StringBuffer buf = StringBuffer();
    for (int i = 0; i < searchFields.length; i++) {
      if (i == 0) buf.writeln(searchFields[i]);
      if (i != 0) buf.writeln("AND " + searchFields[i]);
    }

    List<Map<String, dynamic>> data = await db.query(
      'session',
      where: '''
          ${buf.toString()}
          ${buf.toString().isNotEmpty ? "AND" : ""} ${CourseSessionTable.sqlFindSchema}
          ''',
      whereArgs: [
        if (roomId != null) roomId,
        if (courseId != null) courseId,
        if (reservationId != null) reservationId,
        if (timeIn != null)
          (timeIn.millisecondsSinceEpoch / 1000).round() as int,
        if (timeOut != null)
          (timeOut.millisecondsSinceEpoch / 1000).round() as int,
      ],
    );

    return data.map((e) => CourseSession.fromJson(e)).toList();
  }
}

// **************************************************************************
// Generator: SqlFieldsGen
// **************************************************************************

extension StaffSessionTable on StaffSession {
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
  static String guestId = 'guest_id';
  static String nativeGuestId = 'session.guest_id';

  /// Field data: field ///
  static String id = 'id';
  static String nativeId = 'session.id';

  /// Field data: field ///
  static String timeIn = 'time_in';
  static String nativeTimeIn = 'session.time_in';

  /// Field data: field ///
  static String timeOut = 'time_out';
  static String nativeTimeOut = 'session.time_out';

  static const String sqlSelect = """
    session.guest_id AS session_guest_id,
    session.id AS session_id,
    session.time_in AS session_time_in,
    session.time_out AS session_time_out
  """;

  static const String sqlFindSchema = """
    session.guest_id IS NOT NULL
    AND session.id IS NOT NULL
    AND session.time_in IS NOT NULL
  """;

  static const List schemaMap = [
    'guest_id',
    'id',
    'time_in',
    'time_out',
  ];

  static fromJson(Map<String, dynamic> json) =>
      _$StaffSessionFromJson(getStartWithString_('session', json));

  static StaffSession? schemaToJson(Map<String, dynamic> json) {
    bool valid = true;

    for (String i in json.keys) {
      if (!schemaMap.contains(i)) {
        valid = false;
        break;
      }
    }

    if (valid) {
      return _$StaffSessionFromJson(json);
    }
    return null;
  }

  static StaffSession? filterFromJson(Map<String, dynamic> json) =>
      schemaToJson(getStartWithString_('session', json));
}

extension GuestSessionTable on GuestSession {
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
  static String guestCount = 'guest_count';
  static String nativeGuestCount = 'session.guest_count';

  /// Field data: field ///
  static String priceId = 'price_id';
  static String nativePriceId = 'session.price_id';

  /// Field data: field ///
  static String paidAmount = 'paid_amount';
  static String nativePaidAmount = 'session.paid_amount';

  /// Field data: field ///
  static String guestId = 'guest_id';
  static String nativeGuestId = 'session.guest_id';

  /// Field data: field ///
  static String customPaid = 'custom_paid';
  static String nativeCustomPaid = 'session.custom_paid';

  /// Field data: field ///
  static String id = 'id';
  static String nativeId = 'session.id';

  /// Field data: field ///
  static String timeIn = 'time_in';
  static String nativeTimeIn = 'session.time_in';

  /// Field data: field ///
  static String timeOut = 'time_out';
  static String nativeTimeOut = 'session.time_out';

  static const String sqlSelect = """
    session.guest_count AS session_guest_count,
    session.price_id AS session_price_id,
    session.paid_amount AS session_paid_amount,
    session.guest_id AS session_guest_id,
    session.custom_paid AS session_custom_paid,
    session.id AS session_id,
    session.time_in AS session_time_in,
    session.time_out AS session_time_out
  """;

  static const String sqlFindSchema = """
    session.guest_count IS NOT NULL
    AND session.guest_id IS NOT NULL
    AND session.custom_paid IS NOT NULL
    AND session.id IS NOT NULL
    AND session.time_in IS NOT NULL
  """;

  static const List schemaMap = [
    'guest_count',
    'price_id',
    'paid_amount',
    'guest_id',
    'custom_paid',
    'id',
    'time_in',
    'time_out',
  ];

  static fromJson(Map<String, dynamic> json) =>
      _$GuestSessionFromJson(getStartWithString_('session', json));

  static GuestSession? schemaToJson(Map<String, dynamic> json) {
    bool valid = true;

    for (String i in json.keys) {
      if (!schemaMap.contains(i)) {
        valid = false;
        break;
      }
    }

    if (valid) {
      return _$GuestSessionFromJson(json);
    }
    return null;
  }

  static GuestSession? filterFromJson(Map<String, dynamic> json) =>
      schemaToJson(getStartWithString_('session', json));
}

extension RoomSessionTable on RoomSession {
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
  static String nativeRoomId = 'session.room_id';

  /// Field data: field ///
  static String paidAmount = 'paid_amount';
  static String nativePaidAmount = 'session.paid_amount';

  /// Field data: field ///
  static String guestId = 'guest_id';
  static String nativeGuestId = 'session.guest_id';

  /// Field data: field ///
  static String reservationId = 'reservation_id';
  static String nativeReservationId = 'session.reservation_id';

  /// Field data: field ///
  static String customPaid = 'custom_paid';
  static String nativeCustomPaid = 'session.custom_paid';

  /// Field data: field ///
  static String id = 'id';
  static String nativeId = 'session.id';

  /// Field data: field ///
  static String timeIn = 'time_in';
  static String nativeTimeIn = 'session.time_in';

  /// Field data: field ///
  static String timeOut = 'time_out';
  static String nativeTimeOut = 'session.time_out';

  static const String sqlSelect = """
    session.room_id AS session_room_id,
    session.paid_amount AS session_paid_amount,
    session.guest_id AS session_guest_id,
    session.reservation_id AS session_reservation_id,
    session.custom_paid AS session_custom_paid,
    session.id AS session_id,
    session.time_in AS session_time_in,
    session.time_out AS session_time_out
  """;

  static const String sqlFindSchema = """
    session.room_id IS NOT NULL
    AND session.guest_id IS NOT NULL
    AND session.custom_paid IS NOT NULL
    AND session.id IS NOT NULL
    AND session.time_in IS NOT NULL
  """;

  static const List schemaMap = [
    'room_id',
    'paid_amount',
    'guest_id',
    'reservation_id',
    'custom_paid',
    'id',
    'time_in',
    'time_out',
  ];

  static fromJson(Map<String, dynamic> json) =>
      _$RoomSessionFromJson(getStartWithString_('session', json));

  static RoomSession? schemaToJson(Map<String, dynamic> json) {
    bool valid = true;

    for (String i in json.keys) {
      if (!schemaMap.contains(i)) {
        valid = false;
        break;
      }
    }

    if (valid) {
      return _$RoomSessionFromJson(json);
    }
    return null;
  }

  static RoomSession? filterFromJson(Map<String, dynamic> json) =>
      schemaToJson(getStartWithString_('session', json));
}

extension CourseSessionTable on CourseSession {
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
  static String nativeRoomId = 'session.room_id';

  /// Field data: field ///
  static String courseId = 'course_id';
  static String nativeCourseId = 'session.course_id';

  /// Field data: field ///
  static String reservationId = 'reservation_id';
  static String nativeReservationId = 'session.reservation_id';

  /// Field data: field ///
  static String id = 'id';
  static String nativeId = 'session.id';

  /// Field data: field ///
  static String timeIn = 'time_in';
  static String nativeTimeIn = 'session.time_in';

  /// Field data: field ///
  static String timeOut = 'time_out';
  static String nativeTimeOut = 'session.time_out';

  static const String sqlSelect = """
    session.room_id AS session_room_id,
    session.course_id AS session_course_id,
    session.reservation_id AS session_reservation_id,
    session.id AS session_id,
    session.time_in AS session_time_in,
    session.time_out AS session_time_out
  """;

  static const String sqlFindSchema = """
    session.room_id IS NOT NULL
    AND session.course_id IS NOT NULL
    AND session.reservation_id IS NOT NULL
    AND session.id IS NOT NULL
    AND session.time_in IS NOT NULL
  """;

  static const List schemaMap = [
    'room_id',
    'course_id',
    'reservation_id',
    'id',
    'time_in',
    'time_out',
  ];

  static fromJson(Map<String, dynamic> json) =>
      _$CourseSessionFromJson(getStartWithString_('session', json));

  static CourseSession? schemaToJson(Map<String, dynamic> json) {
    bool valid = true;

    for (String i in json.keys) {
      if (!schemaMap.contains(i)) {
        valid = false;
        break;
      }
    }

    if (valid) {
      return _$CourseSessionFromJson(json);
    }
    return null;
  }

  static CourseSession? filterFromJson(Map<String, dynamic> json) =>
      schemaToJson(getStartWithString_('session', json));
}
