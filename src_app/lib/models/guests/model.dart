import 'dart:convert';

Guest guestFromMap(String str) => Guest.fromMap(json.decode(str));
String guestToMap(Guest data) => json.encode(data.toMap());

class Guest {
  Guest({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.gender,
    this.career,
    this.nationalId,
    this.nationalIdPic,
    this.isAdmin,
    this.isStaff,
    this.createdDate,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final String? gender;
  final String? career;
  final String? nationalId;
  final String? nationalIdPic;
  final bool? isAdmin;
  final bool? isStaff;
  final DateTime? createdDate;

  Guest copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? password,
    String? gender,
    String? career,
    String? nationalId,
    String? nationalIdPic,
    bool? isAdmin,
    bool? isStaff,
    DateTime? createdDate,
  }) =>
      Guest(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        gender: gender ?? this.gender,
        career: career ?? this.career,
        nationalId: nationalId ?? this.nationalId,
        nationalIdPic: nationalIdPic ?? this.nationalIdPic,
        isAdmin: isAdmin ?? this.isAdmin,
        isStaff: isStaff ?? this.isStaff,
        createdDate: createdDate ?? this.createdDate,
      );

  factory Guest.fromMap(Map<String, dynamic> json) => Guest(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        gender: json["gender"],
        career: json["career"],
        nationalId: json["national_id"],
        nationalIdPic: json["national_id_pic"],
        isAdmin: json["is_admin"] == 1 ? true : false,
        isStaff: json["is_staff"] == 1 ? true : false,
        createdDate: DateTime.tryParse(json["created_date"]),
      );

  Map<String, dynamic> toMap() => {
        if (name != null) "name": name,
        if (email != null) "email": email,
        if (phone != null) "phone": phone,
        if (password != null) "password": password,
        if (gender != null) "gender": gender,
        if (career != null) "career": career,
        if (nationalId != null) "national_id": nationalId,
        if (nationalIdPic != null) "national_id_pic": nationalIdPic,
        if (isAdmin != null)
          "is_admin": isAdmin == null
              ? null
              : isAdmin!
                  ? 1
                  : 0,
        if (isStaff != null)
          "is_staff": isStaff == null
              ? null
              : isStaff!
                  ? 1
                  : 0,
      };
}
