// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Session _$SessionFromJson(Map<String, dynamic> json) {
  return _Session.fromJson(json);
}

/// @nodoc
class _$SessionTearOff {
  const _$SessionTearOff();

  _Session call(
      {int? id,
      @JsonKey(name: 'guests_count')
          int? guestsCount,
      @JsonKey(name: 'start_time', fromJson: _fromJson, toJson: _toJson)
          DateTime? startTime,
      @JsonKey(name: 'end_time', fromJson: _fromJson, toJson: _toJson)
          DateTime? endTime,
      @JsonKey(name: 'guest_id')
          required int guestId,
      @JsonKey(name: 'room_id')
          int? roomId,
      @JsonKey(name: 'price_id')
          int? priceId,
      @JsonKey(name: 'course_id')
          int? courseId,
      @JsonKey(name: 'reservation_id')
          int? reservationId}) {
    return _Session(
      id: id,
      guestsCount: guestsCount,
      startTime: startTime,
      endTime: endTime,
      guestId: guestId,
      roomId: roomId,
      priceId: priceId,
      courseId: courseId,
      reservationId: reservationId,
    );
  }

  Session fromJson(Map<String, Object?> json) {
    return Session.fromJson(json);
  }
}

/// @nodoc
const $Session = _$SessionTearOff();

/// @nodoc
mixin _$Session {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'guests_count')
  int? get guestsCount => throw _privateConstructorUsedError; // Date time data
  @JsonKey(name: 'start_time', fromJson: _fromJson, toJson: _toJson)
  DateTime? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time', fromJson: _fromJson, toJson: _toJson)
  DateTime? get endTime =>
      throw _privateConstructorUsedError; // Main references
  @JsonKey(name: 'guest_id')
  int get guestId => throw _privateConstructorUsedError; //  Pricing references
  @JsonKey(name: 'room_id')
  int? get roomId => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_id')
  int? get priceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_id')
  int? get courseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'reservation_id')
  int? get reservationId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: 'guests_count')
          int? guestsCount,
      @JsonKey(name: 'start_time', fromJson: _fromJson, toJson: _toJson)
          DateTime? startTime,
      @JsonKey(name: 'end_time', fromJson: _fromJson, toJson: _toJson)
          DateTime? endTime,
      @JsonKey(name: 'guest_id')
          int guestId,
      @JsonKey(name: 'room_id')
          int? roomId,
      @JsonKey(name: 'price_id')
          int? priceId,
      @JsonKey(name: 'course_id')
          int? courseId,
      @JsonKey(name: 'reservation_id')
          int? reservationId});
}

/// @nodoc
class _$SessionCopyWithImpl<$Res> implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  final Session _value;
  // ignore: unused_field
  final $Res Function(Session) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? guestsCount = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? guestId = freezed,
    Object? roomId = freezed,
    Object? priceId = freezed,
    Object? courseId = freezed,
    Object? reservationId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      guestsCount: guestsCount == freezed
          ? _value.guestsCount
          : guestsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      guestId: guestId == freezed
          ? _value.guestId
          : guestId // ignore: cast_nullable_to_non_nullable
              as int,
      roomId: roomId == freezed
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int?,
      priceId: priceId == freezed
          ? _value.priceId
          : priceId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseId: courseId == freezed
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      reservationId: reservationId == freezed
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$SessionCopyWith(_Session value, $Res Function(_Session) then) =
      __$SessionCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: 'guests_count')
          int? guestsCount,
      @JsonKey(name: 'start_time', fromJson: _fromJson, toJson: _toJson)
          DateTime? startTime,
      @JsonKey(name: 'end_time', fromJson: _fromJson, toJson: _toJson)
          DateTime? endTime,
      @JsonKey(name: 'guest_id')
          int guestId,
      @JsonKey(name: 'room_id')
          int? roomId,
      @JsonKey(name: 'price_id')
          int? priceId,
      @JsonKey(name: 'course_id')
          int? courseId,
      @JsonKey(name: 'reservation_id')
          int? reservationId});
}

/// @nodoc
class __$SessionCopyWithImpl<$Res> extends _$SessionCopyWithImpl<$Res>
    implements _$SessionCopyWith<$Res> {
  __$SessionCopyWithImpl(_Session _value, $Res Function(_Session) _then)
      : super(_value, (v) => _then(v as _Session));

  @override
  _Session get _value => super._value as _Session;

  @override
  $Res call({
    Object? id = freezed,
    Object? guestsCount = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? guestId = freezed,
    Object? roomId = freezed,
    Object? priceId = freezed,
    Object? courseId = freezed,
    Object? reservationId = freezed,
  }) {
    return _then(_Session(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      guestsCount: guestsCount == freezed
          ? _value.guestsCount
          : guestsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      guestId: guestId == freezed
          ? _value.guestId
          : guestId // ignore: cast_nullable_to_non_nullable
              as int,
      roomId: roomId == freezed
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int?,
      priceId: priceId == freezed
          ? _value.priceId
          : priceId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseId: courseId == freezed
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      reservationId: reservationId == freezed
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Session implements _Session {
  _$_Session(
      {this.id,
      @JsonKey(name: 'guests_count')
          this.guestsCount,
      @JsonKey(name: 'start_time', fromJson: _fromJson, toJson: _toJson)
          this.startTime,
      @JsonKey(name: 'end_time', fromJson: _fromJson, toJson: _toJson)
          this.endTime,
      @JsonKey(name: 'guest_id')
          required this.guestId,
      @JsonKey(name: 'room_id')
          this.roomId,
      @JsonKey(name: 'price_id')
          this.priceId,
      @JsonKey(name: 'course_id')
          this.courseId,
      @JsonKey(name: 'reservation_id')
          this.reservationId});

  factory _$_Session.fromJson(Map<String, dynamic> json) =>
      _$$_SessionFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'guests_count')
  final int? guestsCount;
  @override // Date time data
  @JsonKey(name: 'start_time', fromJson: _fromJson, toJson: _toJson)
  final DateTime? startTime;
  @override
  @JsonKey(name: 'end_time', fromJson: _fromJson, toJson: _toJson)
  final DateTime? endTime;
  @override // Main references
  @JsonKey(name: 'guest_id')
  final int guestId;
  @override //  Pricing references
  @JsonKey(name: 'room_id')
  final int? roomId;
  @override
  @JsonKey(name: 'price_id')
  final int? priceId;
  @override
  @JsonKey(name: 'course_id')
  final int? courseId;
  @override
  @JsonKey(name: 'reservation_id')
  final int? reservationId;

  @override
  String toString() {
    return 'Session(id: $id, guestsCount: $guestsCount, startTime: $startTime, endTime: $endTime, guestId: $guestId, roomId: $roomId, priceId: $priceId, courseId: $courseId, reservationId: $reservationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Session &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.guestsCount, guestsCount) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime) &&
            const DeepCollectionEquality().equals(other.guestId, guestId) &&
            const DeepCollectionEquality().equals(other.roomId, roomId) &&
            const DeepCollectionEquality().equals(other.priceId, priceId) &&
            const DeepCollectionEquality().equals(other.courseId, courseId) &&
            const DeepCollectionEquality()
                .equals(other.reservationId, reservationId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(guestsCount),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(endTime),
      const DeepCollectionEquality().hash(guestId),
      const DeepCollectionEquality().hash(roomId),
      const DeepCollectionEquality().hash(priceId),
      const DeepCollectionEquality().hash(courseId),
      const DeepCollectionEquality().hash(reservationId));

  @JsonKey(ignore: true)
  @override
  _$SessionCopyWith<_Session> get copyWith =>
      __$SessionCopyWithImpl<_Session>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SessionToJson(this);
  }
}

abstract class _Session implements Session {
  factory _Session(
      {int? id,
      @JsonKey(name: 'guests_count')
          int? guestsCount,
      @JsonKey(name: 'start_time', fromJson: _fromJson, toJson: _toJson)
          DateTime? startTime,
      @JsonKey(name: 'end_time', fromJson: _fromJson, toJson: _toJson)
          DateTime? endTime,
      @JsonKey(name: 'guest_id')
          required int guestId,
      @JsonKey(name: 'room_id')
          int? roomId,
      @JsonKey(name: 'price_id')
          int? priceId,
      @JsonKey(name: 'course_id')
          int? courseId,
      @JsonKey(name: 'reservation_id')
          int? reservationId}) = _$_Session;

  factory _Session.fromJson(Map<String, dynamic> json) = _$_Session.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'guests_count')
  int? get guestsCount;
  @override // Date time data
  @JsonKey(name: 'start_time', fromJson: _fromJson, toJson: _toJson)
  DateTime? get startTime;
  @override
  @JsonKey(name: 'end_time', fromJson: _fromJson, toJson: _toJson)
  DateTime? get endTime;
  @override // Main references
  @JsonKey(name: 'guest_id')
  int get guestId;
  @override //  Pricing references
  @JsonKey(name: 'room_id')
  int? get roomId;
  @override
  @JsonKey(name: 'price_id')
  int? get priceId;
  @override
  @JsonKey(name: 'course_id')
  int? get courseId;
  @override
  @JsonKey(name: 'reservation_id')
  int? get reservationId;
  @override
  @JsonKey(ignore: true)
  _$SessionCopyWith<_Session> get copyWith =>
      throw _privateConstructorUsedError;
}
