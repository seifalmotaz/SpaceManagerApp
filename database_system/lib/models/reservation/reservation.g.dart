// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reservation _$$_ReservationFromJson(Map<String, dynamic> json) =>
    _$_Reservation(
      id: json['id'] as int?,
      guestId: json['guest_id'] as int?,
      roomId: json['room_id'] as int?,
      paidAmount: (json['paid_amount'] as num?)?.toDouble(),
      timeIn: DataCompiler.fromDBDate(json['time_in'] as int?),
      timeOut: DataCompiler.fromDBDate(json['time_out'] as int?),
      createdDate: DataCompiler.fromDBDate(json['created_date'] as int?),
    );

Map<String, dynamic> _$$_ReservationToJson(_$_Reservation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guest_id': instance.guestId,
      'room_id': instance.roomId,
      'paid_amount': instance.paidAmount,
      'time_in': DataCompiler.toDBDate(instance.timeIn),
      'time_out': DataCompiler.toDBDate(instance.timeOut),
      'created_date': DataCompiler.toDBDate(instance.createdDate),
    };

// **************************************************************************
// EngineSQLGenerator
// **************************************************************************

extension ReservationFieldsSQL on ReservationFields {
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

// \ // \ Start: id // \ // \
  static String nativeId = 'reservation.id';
  static String id = 'id';
// \ // \ End: id // \ // \
// \ // \ Start: guestId // \ // \
  static String nativeGuestId = 'reservation.guest_id';
  static String guestId = 'guest_id';
// \ // \ End: guestId // \ // \
// \ // \ Start: roomId // \ // \
  static String nativeRoomId = 'reservation.room_id';
  static String roomId = 'room_id';
// \ // \ End: roomId // \ // \
// \ // \ Start: paidAmount // \ // \
  static String nativePaidAmount = 'reservation.paid_amount';
  static String paidAmount = 'paid_amount';
// \ // \ End: paidAmount // \ // \
// \ // \ Start: timeIn // \ // \
  static String nativeTimeIn = 'reservation.time_in';
  static String timeIn = 'time_in';
// \ // \ End: timeIn // \ // \
// \ // \ Start: timeOut // \ // \
  static String nativeTimeOut = 'reservation.time_out';
  static String timeOut = 'time_out';
// \ // \ End: timeOut // \ // \
// \ // \ Start: createdDate // \ // \
  static String nativeCreatedDate = 'reservation.created_date';
  static String createdDate = 'created_date';
// \ // \ End: createdDate // \ // \

  static fromJson(Map<String, dynamic> json) =>
      _$$_ReservationFromJson(getStartWithString_('reservation', json));
}
