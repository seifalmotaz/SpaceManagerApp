import 'dart:convert';

import 'package:spacemanager/constants/func.dart';

Session sessionFromMap(String str) => Session.fromMap(json.decode(str));

String sessionToMap(Session data) => json.encode(data.toMap());

class Session {
  Session({
    this.id,
    this.startTime,
    this.endTime,
    this.guestId,
    this.roomId,
    this.priceId,
    this.courseId,
    this.reservationId,
    this.guestsCount,
  });

  final int? id;
  final DateTime? startTime;
  final DateTime? endTime;
  final int? guestId;
  final int? roomId;
  final int? priceId;
  final int? courseId;
  final int? reservationId;
  final int? guestsCount;

  Session copyWith({
    int? id,
    int? rate,
    DateTime? startTime,
    DateTime? endTime,
    int? guestId,
    int? roomId,
    int? priceId,
    int? courseId,
    int? reservationId,
    int? guestsCount,
  }) =>
      Session(
        id: id ?? this.id,
        startTime: this.startTime,
        endTime: endTime ?? this.endTime,
        guestId: guestId ?? this.guestId,
        roomId: roomId ?? this.roomId,
        priceId: priceId ?? this.priceId,
        courseId: courseId ?? this.courseId,
        reservationId: reservationId ?? this.reservationId,
        guestsCount: guestsCount ?? this.guestsCount,
      );

  factory Session.fromMap(Map<String, dynamic> json) => Session(
        id: json["id"],
        startTime: fromDateDB(json["start_time"]),
        endTime: fromDateDB(json["end_time"]),
        guestId: json["guest_id"],
        roomId: json["room_id"],
        priceId: json["price_id"],
        courseId: json["course_id"],
        reservationId: json["reservation_id"],
        guestsCount: json["guests_count"],
      );

  Map<String, dynamic> toMap() => {
        if (endTime != null) "end_time": endTime?.toUtc().toIso8601String(),
        if (guestId != null) "guest_id": guestId,
        if (roomId != null) "room_id": roomId,
        if (priceId != null) "price_id": priceId,
        if (courseId != null) "course_id": courseId,
        if (reservationId != null) "reservation_id": reservationId,
        if (guestsCount != null) "guests_count": guestsCount,
      };
}
