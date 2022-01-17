// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Guest _$GuestFromJson(Map<String, dynamic> json) => Guest(
      createdDate: DataCompiler.fromDBDate(json['created_date'] as int),
      email: json['email'] as String?,
      id: json['id'] as int,
      isAdmin: DataCompiler.fromDBool(json['is_admin'] as int),
      isExpired: DataCompiler.fromDBool(json['is_expired'] as int),
      isStaff: DataCompiler.fromDBool(json['is_staff'] as int),
      name: json['name'] as String?,
      nationalId: json['national_id'] as String?,
      nationalIdPic: json['national_id_pic'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$GuestToJson(Guest instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('created_date', DataCompiler.toDBDate(instance.createdDate));
  writeNotNull('is_expired', DataCompiler.toDBool(instance.isExpired));
  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  writeNotNull('password', instance.password);
  writeNotNull('is_admin', DataCompiler.toDBool(instance.isAdmin));
  writeNotNull('is_staff', DataCompiler.toDBool(instance.isStaff));
  writeNotNull('national_id', instance.nationalId);
  writeNotNull('national_id_pic', instance.nationalIdPic);
  return val;
}

// **************************************************************************
// Generator: QuerysGen
// **************************************************************************

class GuestQuery {
  final Database db;
  GuestQuery(this.db);

  Future<int> create({
    DateTime? createdDate,
    bool? isExpired,
    String? name,
    String? email,
    String? phone,
    String? password,
    bool? isAdmin,
    bool? isStaff,
    String? nationalId,
    String? nationalIdPic,
  }) async =>
      await db.insert('guest', {
        if (createdDate != null)
          'created_date': (createdDate.millisecondsSinceEpoch / 1000) as int,
        if (isExpired != null) 'is_expired': isExpired ? 1 : 0,
        if (name != null) 'name': name,
        if (email != null) 'email': email,
        if (phone != null) 'phone': phone,
        if (password != null) 'password': password,
        if (isAdmin != null) 'is_admin': isAdmin ? 1 : 0,
        if (isStaff != null) 'is_staff': isStaff ? 1 : 0,
        if (nationalId != null) 'national_id': nationalId,
        if (nationalIdPic != null) 'national_id_pic': nationalIdPic,
      });

  Future<Guest> read(int id) async {
    List<Map<String, dynamic>> data = await db.query(
      'guest',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Guest.fromJson(data.first);
  }

  Future<int> update({
    required int id,
    DateTime? createdDate,
    bool? isExpired,
    String? name,
    String? email,
    String? phone,
    String? password,
    bool? isAdmin,
    bool? isStaff,
    String? nationalId,
    String? nationalIdPic,
  }) async =>
      await db.update(
        'guest',
        {
          if (createdDate != null)
            'created_date': (createdDate.millisecondsSinceEpoch / 1000) as int,
          if (isExpired != null) 'is_expired': isExpired ? 1 : 0,
          if (name != null) 'name': name,
          if (email != null) 'email': email,
          if (phone != null) 'phone': phone,
          if (password != null) 'password': password,
          if (isAdmin != null) 'is_admin': isAdmin ? 1 : 0,
          if (isStaff != null) 'is_staff': isStaff ? 1 : 0,
          if (nationalId != null) 'national_id': nationalId,
          if (nationalIdPic != null) 'national_id_pic': nationalIdPic,
        },
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<int> delete(int id) async => await db.delete(
        'guest',
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<List<Guest>> find({
    DateTime? createdDate,
    bool? isExpired,
    String? name,
    String? email,
    String? phone,
    String? password,
    bool? isAdmin,
    bool? isStaff,
    String? nationalId,
    String? nationalIdPic,
  }) async {
    List<String> searchFields = [];
    if (createdDate != null) {
      searchFields.add("guest.created_date = ?");
    }
    if (isExpired != null) {
      searchFields.add("guest.is_expired = ?");
    }
    if (name != null) {
      searchFields.add("guest.name = ?");
    }
    if (email != null) {
      searchFields.add("guest.email = ?");
    }
    if (phone != null) {
      searchFields.add("guest.phone = ?");
    }
    if (password != null) {
      searchFields.add("guest.password = ?");
    }
    if (isAdmin != null) {
      searchFields.add("guest.is_admin = ?");
    }
    if (isStaff != null) {
      searchFields.add("guest.is_staff = ?");
    }
    if (nationalId != null) {
      searchFields.add("guest.national_id = ?");
    }
    if (nationalIdPic != null) {
      searchFields.add("guest.national_id_pic = ?");
    }

    StringBuffer buf = StringBuffer();
    for (int i = 0; i < searchFields.length; i++) {
      if (i == 0) buf.writeln(searchFields[i]);
      if (i != 0) buf.writeln("AND " + searchFields[i]);
    }

    List<Map<String, dynamic>> data = await db.query(
      'guest',
      where: '''
          ${buf.toString()}
          AND ${GuestTable.sqlFindSchema}
          ''',
      whereArgs: [
        if (createdDate != null) createdDate,
        if (isExpired != null) isExpired,
        if (name != null) name,
        if (email != null) email,
        if (phone != null) phone,
        if (password != null) password,
        if (isAdmin != null) isAdmin,
        if (isStaff != null) isStaff,
        if (nationalId != null) nationalId,
        if (nationalIdPic != null) nationalIdPic,
      ],
    );

    return data.map((e) => Guest.fromJson(e)).toList();
  }
}

// **************************************************************************
// Generator: SqlFieldsGen
// **************************************************************************

extension GuestTable on Guest {
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
  static String nativeId = 'guest.id';

  /// Field data: field ///
  static String createdDate = 'created_date';
  static String nativeCreatedDate = 'guest.created_date';

  /// Field data: field ///
  static String isExpired = 'is_expired';
  static String nativeIsExpired = 'guest.is_expired';

  /// Field data: field ///
  static String name = 'name';
  static String nativeName = 'guest.name';

  /// Field data: field ///
  static String email = 'email';
  static String nativeEmail = 'guest.email';

  /// Field data: field ///
  static String phone = 'phone';
  static String nativePhone = 'guest.phone';

  /// Field data: field ///
  static String password = 'password';
  static String nativePassword = 'guest.password';

  /// Field data: field ///
  static String isAdmin = 'is_admin';
  static String nativeIsAdmin = 'guest.is_admin';

  /// Field data: field ///
  static String isStaff = 'is_staff';
  static String nativeIsStaff = 'guest.is_staff';

  /// Field data: field ///
  static String nationalId = 'national_id';
  static String nativeNationalId = 'guest.national_id';

  /// Field data: field ///
  static String nationalIdPic = 'national_id_pic';
  static String nativeNationalIdPic = 'guest.national_id_pic';

  static const String sqlSelect = """
    guest.id AS guest_id,
    guest.created_date AS guest_created_date,
    guest.is_expired AS guest_is_expired,
    guest.name AS guest_name,
    guest.email AS guest_email,
    guest.phone AS guest_phone,
    guest.password AS guest_password,
    guest.is_admin AS guest_is_admin,
    guest.is_staff AS guest_is_staff,
    guest.national_id AS guest_national_id,
    guest.national_id_pic AS guest_national_id_pic
  """;

  static const String sqlFindSchema = """
    guest.id IS NOT NULL
    AND guest.created_date IS NOT NULL
    AND guest.is_expired IS NOT NULL
    AND guest.is_admin IS NOT NULL
    AND guest.is_staff IS NOT NULL
  """;

  static const List schemaMap = [
    'id',
    'created_date',
    'is_expired',
    'name',
    'email',
    'phone',
    'password',
    'is_admin',
    'is_staff',
    'national_id',
    'national_id_pic',
  ];

  static fromJson(Map<String, dynamic> json) =>
      _$GuestFromJson(getStartWithString_('guest', json));

  static Guest? schemaToJson(Map<String, dynamic> json) {
    bool valid = true;

    for (String i in json.keys) {
      if (!schemaMap.contains(i)) {
        valid = false;
        break;
      }
    }

    if (valid) {
      return _$GuestFromJson(json);
    }
  }

  static Guest? filterFromJson(Map<String, dynamic> json) =>
      schemaToJson(getStartWithString_('guest', json));
}
