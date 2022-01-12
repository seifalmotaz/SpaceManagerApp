// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Guest _$GuestFromJson(Map<String, dynamic> json) => Guest(
      createdDate: DataCompiler.fromDBDate(json['created_date'] as int),
      email: json['email'] as String,
      id: json['id'] as int,
      isAdmin: json['is_admin'] as bool,
      isExpired: json['is_expired'] as bool,
      isStaff: json['is_staff'] as bool,
      name: json['name'] as String,
      nationalID: json['national_i_d'] as String,
      nationalIdPic: json['national_id_pic'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
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
  val['is_expired'] = instance.isExpired;
  val['name'] = instance.name;
  val['email'] = instance.email;
  val['phone'] = instance.phone;
  val['password'] = instance.password;
  val['is_admin'] = instance.isAdmin;
  val['is_staff'] = instance.isStaff;
  val['national_i_d'] = instance.nationalID;
  val['national_id_pic'] = instance.nationalIdPic;
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
    String? nationalID,
    String? nationalIdPic,
  }) async =>
      await db.insert('guest', {
        if (createdDate != null) 'created_date': createdDate,
        if (isExpired != null) 'is_expired': isExpired,
        if (name != null) 'name': name,
        if (email != null) 'email': email,
        if (phone != null) 'phone': phone,
        if (password != null) 'password': password,
        if (isAdmin != null) 'is_admin': isAdmin,
        if (isStaff != null) 'is_staff': isStaff,
        if (nationalID != null) 'national_i_d': nationalID,
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
    String? nationalID,
    String? nationalIdPic,
  }) async =>
      await db.update(
        'guest',
        {
          if (createdDate != null) 'created_date': createdDate,
          if (isExpired != null) 'is_expired': isExpired,
          if (name != null) 'name': name,
          if (email != null) 'email': email,
          if (phone != null) 'phone': phone,
          if (password != null) 'password': password,
          if (isAdmin != null) 'is_admin': isAdmin,
          if (isStaff != null) 'is_staff': isStaff,
          if (nationalID != null) 'national_i_d': nationalID,
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
    String? nationalID,
    String? nationalIdPic,
  }) async {
    List<Map<String, dynamic>> data = await db.query(
      'guest',
      where: '''
          ${createdDate == null ? "" : "guest.created_date IS NOT NULL"}
          ${isExpired == null ? "" : "AND guest.is_expired IS NOT NULL"}
          ${name == null ? "" : "AND guest.name IS NOT NULL"}
          ${email == null ? "" : "AND guest.email IS NOT NULL"}
          ${phone == null ? "" : "AND guest.phone IS NOT NULL"}
          ${password == null ? "" : "AND guest.password IS NOT NULL"}
          ${isAdmin == null ? "" : "AND guest.is_admin IS NOT NULL"}
          ${isStaff == null ? "" : "AND guest.is_staff IS NOT NULL"}
          ${nationalID == null ? "" : "AND guest.national_i_d IS NOT NULL"}
          ${nationalIdPic == null ? "" : "AND guest.national_id_pic IS NOT NULL"}

          AND ${GuestTable.sqlFindSchema}
          ''',
      whereArgs: [
        createdDate,
        isExpired,
        name,
        email,
        phone,
        password,
        isAdmin,
        isStaff,
        nationalID,
        nationalIdPic,
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
  static String nationalID = 'national_i_d';
  static String nativeNationalID = 'guest.national_i_d';

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
    guest.national_i_d AS guest_national_i_d,
    guest.national_id_pic AS guest_national_id_pic,
  """;

  static const String sqlFindSchema = """
    guest.id IS NOT NULL
    AND guest.created_date IS NOT NULL
    AND guest.is_expired IS NOT NULL
    AND guest.name IS NOT NULL
    AND guest.email IS NOT NULL
    AND guest.phone IS NOT NULL
    AND guest.password IS NOT NULL
    AND guest.is_admin IS NOT NULL
    AND guest.is_staff IS NOT NULL
    AND guest.national_i_d IS NOT NULL
    AND guest.national_id_pic IS NOT NULL
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
    'national_i_d',
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
}
