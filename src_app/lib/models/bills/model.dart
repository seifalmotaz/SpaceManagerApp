import 'dart:convert';

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
  final String? staffId;
  final String? sessionId;
  final String? reservationId;
  final DateTime? createdDate;

  Bill copyWith({
    int? id,
    double? total,
    String? staffId,
    String? sessionId,
    String? reservationId,
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
        createdDate: DateTime.tryParse(json["created_date"]),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "staff_id": staffId,
        "session_id": sessionId,
        "reservation_id": reservationId,
        "created_date": createdDate?.toIso8601String(),
      };
}
