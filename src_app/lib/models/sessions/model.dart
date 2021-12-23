import 'dart:convert';

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
        startTime: DateTime.tryParse(json["start_time"].toString()),
        endTime: DateTime.tryParse(json["end_time"].toString()),
        guestId: json["guest_id"],
        roomId: json["room_id"],
        priceId: json["price_id"],
        courseId: json["course_id"],
        reservationId: json["reservation_id"],
        guestsCount: json["guests_count"],
      );

  Map<String, dynamic> toMap() => {
        "end_time": endTime?.toIso8601String(),
        "guest_id": guestId,
        "room_id": roomId,
        "price_id": priceId,
        "course_id": courseId,
        "reservation_id": reservationId,
        "guests_count": guestsCount,
      };
}
