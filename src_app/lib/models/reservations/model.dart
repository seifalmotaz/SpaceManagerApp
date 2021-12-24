// To parse this JSON data, do
//
//     final reservation = reservationFromMap(jsonString);

import 'dart:convert';

Reservation reservationFromMap(String str) =>
    Reservation.fromMap(json.decode(str));

String reservationToMap(Reservation data) => json.encode(data.toMap());

class Reservation {
  Reservation({
    this.id,
    this.isPrePaid,
    this.startTime,
    this.endTime,
    this.roomId,
    this.courseId,
    this.guestId,
    this.createdDate,
    this.isCancelled,
  });

  final int? id;
  final bool? isPrePaid;
  final DateTime? startTime;
  final DateTime? endTime;
  final DateTime? createdDate;
  final double? roomId;
  final double? courseId;
  final double? guestId;
  final bool? isCancelled;

  Reservation copyWith({
    int? id,
    bool? isPrePaid,
    DateTime? startTime,
    DateTime? endTime,
    double? roomId,
    double? courseId,
    double? guestId,
    DateTime? createdDate,
    bool? isCancelled;
  }) =>
      Reservation(
        id: id ?? this.id,
        isPrePaid: isPrePaid ?? this.isPrePaid,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        roomId: roomId ?? this.roomId,
        createdDate: createdDate ?? this.createdDate,
        courseId: courseId ?? this.courseId,
        guestId: guestId ?? this.guestId,
        isCancelled: isCancelled??this.isCancelled
      );

  factory Reservation.fromMap(Map<String, dynamic> json) => Reservation(
        id: json["id"],
        isPrePaid: json["is_pre_paid"] == 1 ? true : false,
        startTime: DateTime.tryParse(json["start_time"].toString()),
        endTime: DateTime.tryParse(json["end_time"].toString()),
        createdDate: DateTime.tryParse(json["created_date"].toString()),
        roomId: json["room_id"].toDouble(),
        courseId: json["course_id"].toDouble(),
        guestId: json["guest_id"].toDouble(),
        isCancelled: json["is_cancelled"] == 1 ? true : false,
      );

  Map<String, dynamic> toMap() => {
        "start_time": startTime?.toIso8601String(),
        "end_time": endTime?.toIso8601String(),
        "created_date": createdDate?.toIso8601String(),
        "room_id": roomId,
        "course_id": courseId,
        "guest_id": guestId,
        "is_pre_paid": isPrePaid == null
            ? null
            : isPrePaid!
                ? 1
                : 0,
        "is_cancelled": isCancelled == null
            ? null
            : isCancelled!
                ? 1
                : 0,
      };
}
