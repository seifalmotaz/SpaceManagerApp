import 'dart:convert';

import 'package:spacemanager/constants/from_date_db.dart';

Bill billFromMap(String str) => Bill.fromMap(json.decode(str));
String billToMap(Bill data) => json.encode(data.toMap());

class Bill {
  Bill({
    this.id,
    this.total,
    this.staffId,
    this.sessionId,
    this.reservationId,
    this.createdDate,
  });

  final int? id;
  final double? total;
  final int? staffId;
  final int? sessionId;
  final int? reservationId;
  final DateTime? createdDate;

  Bill copyWith({
    int? id,
    double? total,
    int? staffId,
    int? sessionId,
    int? reservationId,
    DateTime? createdDate,
  }) =>
      Bill(
        id: id ?? this.id,
        total: total ?? this.total,
        staffId: staffId ?? this.staffId,
        sessionId: sessionId ?? this.sessionId,
        reservationId: reservationId ?? this.reservationId,
        createdDate: createdDate ?? this.createdDate,
      );

  factory Bill.fromMap(Map<String, dynamic> json) => Bill(
        id: json["id"],
        total: json["total"].toDouble(),
        staffId: json["staff_id"],
        sessionId: json["session_id"],
        reservationId: json["reservation_id"],
        createdDate: fromDateDB(json["created_date"]),
      );

  Map<String, dynamic> toMap() => {
        if (total != null) "total": total,
        if (staffId != null) "staff_id": staffId,
        if (sessionId != null) "session_id": sessionId,
        if (reservationId != null) "reservation_id": reservationId,
      };
}
