// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Session _$$_SessionFromJson(Map<String, dynamic> json) => _$_Session(
      id: json['id'] as int?,
      guestId: json['guest_id'] as int?,
      priceId: json['price_id'] as int?,
      paidAmount: (json['paid_amount'] as num?)?.toDouble(),
      guestCount: json['guest_count'] as int?,
      timeIn: DataCompiler.fromDBDate(json['time_in'] as int?),
      timeOut: DataCompiler.fromDBDate(json['time_out'] as int?),
    );

Map<String, dynamic> _$$_SessionToJson(_$_Session instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guest_id': instance.guestId,
      'price_id': instance.priceId,
      'paid_amount': instance.paidAmount,
      'guest_count': instance.guestCount,
      'time_in': DataCompiler.toDBDate(instance.timeIn),
      'time_out': DataCompiler.toDBDate(instance.timeOut),
    };

// **************************************************************************
// EngineSQLGenerator
// **************************************************************************

extension SessionFieldsSQL on SessionFields {
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
  static String nativeId = 'session.id';
  static String id = 'id';
// \ // \ End: id // \ // \
// \ // \ Start: guestId // \ // \
  static String nativeGuestId = 'session.guest_id';
  static String guestId = 'guest_id';
// \ // \ End: guestId // \ // \
// \ // \ Start: priceId // \ // \
  static String nativePriceId = 'session.price_id';
  static String priceId = 'price_id';
// \ // \ End: priceId // \ // \
// \ // \ Start: paidAmount // \ // \
  static String nativePaidAmount = 'session.paid_amount';
  static String paidAmount = 'paid_amount';
// \ // \ End: paidAmount // \ // \
// \ // \ Start: guestCount // \ // \
  static String nativeGuestCount = 'session.guest_count';
  static String guestCount = 'guest_count';
// \ // \ End: guestCount // \ // \
// \ // \ Start: timeIn // \ // \
  static String nativeTimeIn = 'session.time_in';
  static String timeIn = 'time_in';
// \ // \ End: timeIn // \ // \
// \ // \ Start: timeOut // \ // \
  static String nativeTimeOut = 'session.time_out';
  static String timeOut = 'time_out';
// \ // \ End: timeOut // \ // \

  static fromJson(Map<String, dynamic> json) =>
      _$$_SessionFromJson(getStartWithString_('session', json));
}
