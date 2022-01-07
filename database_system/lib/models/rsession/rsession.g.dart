// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rsession.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RSession _$$_RSessionFromJson(Map<String, dynamic> json) => _$_RSession(
      id: json['id'] as int?,
      guestId: json['guest_id'] as int?,
      roomId: json['room_id'] as int?,
      paidAmount: (json['paid_amount'] as num?)?.toDouble(),
      timeIn: DataCompiler.fromDBDate(json['time_in'] as int?),
      timeOut: DataCompiler.fromDBDate(json['time_out'] as int?),
    );

Map<String, dynamic> _$$_RSessionToJson(_$_RSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guest_id': instance.guestId,
      'room_id': instance.roomId,
      'paid_amount': instance.paidAmount,
      'time_in': DataCompiler.toDBDate(instance.timeIn),
      'time_out': DataCompiler.toDBDate(instance.timeOut),
    };

// **************************************************************************
// EngineSQLGenerator
// **************************************************************************

extension RSessionFieldsSQL on RSessionFields {
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
  static String nativeId = 'rsession.id';
  static String id = 'id';
// \ // \ End: id // \ // \
// \ // \ Start: guestId // \ // \
  static String nativeGuestId = 'rsession.guest_id';
  static String guestId = 'guest_id';
// \ // \ End: guestId // \ // \
// \ // \ Start: roomId // \ // \
  static String nativeRoomId = 'rsession.room_id';
  static String roomId = 'room_id';
// \ // \ End: roomId // \ // \
// \ // \ Start: paidAmount // \ // \
  static String nativePaidAmount = 'rsession.paid_amount';
  static String paidAmount = 'paid_amount';
// \ // \ End: paidAmount // \ // \
// \ // \ Start: timeIn // \ // \
  static String nativeTimeIn = 'rsession.time_in';
  static String timeIn = 'time_in';
// \ // \ End: timeIn // \ // \
// \ // \ Start: timeOut // \ // \
  static String nativeTimeOut = 'rsession.time_out';
  static String timeOut = 'time_out';
// \ // \ End: timeOut // \ // \

  static fromJson(Map<String, dynamic> json) =>
      _$$_RSessionFromJson(getStartWithString_('rsession', json));
}
