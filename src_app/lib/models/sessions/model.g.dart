// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionfromMap(Map<String, dynamic> json) => Session(
      id: json['id'],
      guestsCount: json['guests_count'],
      startTime: Session._fromMap(json['start_time'] as String?),
      endTime: Session._fromMap(json['end_time'] as String?),
      guestId: json['guest_id'],
      roomId: json['room_id'],
      priceId: json['price_id'],
      courseId: json['course_id'],
      reservationId: json['reservation_id'],
    );

Map<String, dynamic> _$SessiontoMap(Session instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('guests_count', instance.guestsCount);
  writeNotNull('start_time', Session._toMap(instance.startTime));
  writeNotNull('end_time', Session._toMap(instance.endTime));
  writeNotNull('guest_id', instance.guestId);
  writeNotNull('room_id', instance.roomId);
  writeNotNull('price_id', instance.priceId);
  writeNotNull('course_id', instance.courseId);
  writeNotNull('reservation_id', instance.reservationId);
  return val;
}
