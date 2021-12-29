// To parse this JSON data, do
//
//     final reservation = reservationFromMap(jsonString);

import 'dart:convert';

import 'package:spacemanager/constants/func.dart';

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
  bool? isPrePaid;
  DateTime? startTime;
  DateTime? endTime;
  DateTime? createdDate;
  int? roomId;
  int? courseId;
  int? guestId;
  bool? isCancelled;

  double get prePaidPersent => .25;

  Reservation copyWith({
    int? id,
    bool? isPrePaid,
    DateTime? startTime,
    DateTime? endTime,
    int? roomId,
    int? courseId,
    int? guestId,
    DateTime? createdDate,
    bool? isCancelled,
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
          isCancelled: isCancelled ?? this.isCancelled);

  factory Reservation.fromMap(Map<String, dynamic> json) => Reservation(
        id: json["id"],
        isPrePaid: json["is_pre_paid"] == 1 ? true : false,
        startTime: fromDateDB(json["start_time"]),
        endTime: fromDateDB(json["end_time"]),
        createdDate: fromDateDB(json["created_date"]),
        roomId: json["room_id"],
        courseId: json["course_id"],
        guestId: json["guest_id"],
        isCancelled: json["is_cancelled"] == 1 ? true : false,
      );

  Map<String, dynamic> toMap() => {
        if (startTime != null)
          "start_time": startTime?.toUtc().toIso8601String(),
        if (endTime != null) "end_time": endTime?.toUtc().toIso8601String(),
        if (roomId != null) "room_id": roomId,
        if (courseId != null) "course_id": courseId,
        if (guestId != null) "guest_id": guestId,
        if (isPrePaid != null)
          "is_pre_paid": isPrePaid == null
              ? null
              : isPrePaid!
                  ? 1
                  : 0,
        if (isCancelled != null)
          "is_cancelled": isCancelled == null
              ? null
              : isCancelled!
                  ? 1
                  : 0,
      };
}
