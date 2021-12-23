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

Reservation _$ReservationFromJson(Map<String, dynamic> json) {
  return _Reservation.fromJson(json);
}

/// @nodoc
class _$ReservationTearOff {
  const _$ReservationTearOff();

  _Reservation call(
      {int? id,
      @JsonKey(name: 'is_pre_paid', fromJson: _fromBoolJsone, toJson: _toBoolJsone)
          bool? isPrePaId,
      @JsonKey(name: 'start_time', fromJson: _fromJson, toJson: _toJson)
          DateTime? startTime,
      @JsonKey(name: 'end_time', fromJson: _fromJson, toJson: _toJson)
          DateTime? endTime,
      @JsonKey(name: 'room_id')
          required int roomId,
      @JsonKey(name: 'course_id')
          int? courseId,
      @JsonKey(name: 'guest_id')
          required int guestId}) {
    return _Reservation(
      id: id,
      isPrePaId: isPrePaId,
      startTime: startTime,
      endTime: endTime,
      roomId: roomId,
      courseId: courseId,
      guestId: guestId,
    );
  }

  Reservation fromJson(Map<String, Object?> json) {
    return Reservation.fromJson(json);
  }
}

/// @nodoc
const $Reservation = _$ReservationTearOff();

/// @nodoc
mixin _$Reservation {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_pre_paid', fromJson: _fromBoolJsone, toJson: _toBoolJsone)
  bool? get isPrePaId => throw _privateConstructorUsedError; // Date time data
  @JsonKey(name: 'start_time', fromJson: _fromJson, toJson: _toJson)
  DateTime? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time', fromJson: _fromJson, toJson: _toJson)
  DateTime? get endTime => throw _privateConstructorUsedError; // Refrensaces
  @JsonKey(name: 'room_id')
  int get roomId => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_id')
  int? get courseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'guest_id')
  int get guestId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReservationCopyWith<Reservation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationCopyWith<$Res> {
  factory $ReservationCopyWith(
          Reservation value, $Res Function(Reservation) then) =
      _$ReservationCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: 'is_pre_paid', fromJson: _fromBoolJsone, toJson: _toBoolJsone)
          bool? isPrePaId,
      @JsonKey(name: 'start_time', fromJson: _fromJson, toJson: _toJson)
          DateTime? startTime,
      @JsonKey(name: 'end_time', fromJson: _fromJson, toJson: _toJson)
          DateTime? endTime,
      @JsonKey(name: 'room_id')
          int roomId,
      @JsonKey(name: 'course_id')
          int? courseId,
      @JsonKey(name: 'guest_id')
          int guestId});
}

/// @nodoc
class _$ReservationCopyWithImpl<$Res> implements $ReservationCopyWith<$Res> {
  _$ReservationCopyWithImpl(this._value, this._then);

  final Reservation _value;
  // ignore: unused_field
  final $Res Function(Reservation) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? isPrePaId = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? roomId = freezed,
    Object? courseId = freezed,
    Object? guestId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isPrePaId: isPrePaId == freezed
          ? _value.isPrePaId
          : isPrePaId // ignore: cast_nullable_to_non_nullable
              as bool?,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      roomId: roomId == freezed
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      courseId: courseId == freezed
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      guestId: guestId == freezed
          ? _value.guestId
          : guestId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ReservationCopyWith<$Res>
    implements $ReservationCopyWith<$Res> {
  factory _$ReservationCopyWith(
          _Reservation value, $Res Function(_Reservation) then) =
      __$ReservationCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: 'is_pre_paid', fromJson: _fromBoolJsone, toJson: _toBoolJsone)
          bool? isPrePaId,
      @JsonKey(name: 'start_time', fromJson: _fromJson, toJson: _toJson)
          DateTime? startTime,
      @JsonKey(name: 'end_time', fromJson: _fromJson, toJson: _toJson)
          DateTime? endTime,
      @JsonKey(name: 'room_id')
          int roomId,
      @JsonKey(name: 'course_id')
          int? courseId,
      @JsonKey(name: 'guest_id')
          int guestId});
}

/// @nodoc
class __$ReservationCopyWithImpl<$Res> extends _$ReservationCopyWithImpl<$Res>
    implements _$ReservationCopyWith<$Res> {
  __$ReservationCopyWithImpl(
      _Reservation _value, $Res Function(_Reservation) _then)
      : super(_value, (v) => _then(v as _Reservation));

  @override
  _Reservation get _value => super._value as _Reservation;

  @override
  $Res call({
    Object? id = freezed,
    Object? isPrePaId = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? roomId = freezed,
    Object? courseId = freezed,
    Object? guestId = freezed,
  }) {
    return _then(_Reservation(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isPrePaId: isPrePaId == freezed
          ? _value.isPrePaId
          : isPrePaId // ignore: cast_nullable_to_non_nullable
              as bool?,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      roomId: roomId == freezed
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      courseId: courseId == freezed
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      guestId: guestId == freezed
          ? _value.guestId
          : guestId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reservation implements _Reservation {
  _$_Reservation(
      {this.id,
      @JsonKey(name: 'is_pre_paid', fromJson: _fromBoolJsone, toJson: _toBoolJsone)
          this.isPrePaId,
      @JsonKey(name: 'start_time', fromJson: _fromJson, toJson: _toJson)
          this.startTime,
      @JsonKey(name: 'end_time', fromJson: _fromJson, toJson: _toJson)
          this.endTime,
      @JsonKey(name: 'room_id')
          required this.roomId,
      @JsonKey(name: 'course_id')
          this.courseId,
      @JsonKey(name: 'guest_id')
          required this.guestId});

  factory _$_Reservation.fromJson(Map<String, dynamic> json) =>
      _$$_ReservationFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'is_pre_paid', fromJson: _fromBoolJsone, toJson: _toBoolJsone)
  final bool? isPrePaId;
  @override // Date time data
  @JsonKey(name: 'start_time', fromJson: _fromJson, toJson: _toJson)
  final DateTime? startTime;
  @override
  @JsonKey(name: 'end_time', fromJson: _fromJson, toJson: _toJson)
  final DateTime? endTime;
  @override // Refrensaces
  @JsonKey(name: 'room_id')
  final int roomId;
  @override
  @JsonKey(name: 'course_id')
  final int? courseId;
  @override
  @JsonKey(name: 'guest_id')
  final int guestId;

  @override
  String toString() {
    return 'Reservation(id: $id, isPrePaId: $isPrePaId, startTime: $startTime, endTime: $endTime, roomId: $roomId, courseId: $courseId, guestId: $guestId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reservation &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.isPrePaId, isPrePaId) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime) &&
            const DeepCollectionEquality().equals(other.roomId, roomId) &&
            const DeepCollectionEquality().equals(other.courseId, courseId) &&
            const DeepCollectionEquality().equals(other.guestId, guestId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(isPrePaId),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(endTime),
      const DeepCollectionEquality().hash(roomId),
      const DeepCollectionEquality().hash(courseId),
      const DeepCollectionEquality().hash(guestId));

  @JsonKey(ignore: true)
  @override
  _$ReservationCopyWith<_Reservation> get copyWith =>
      __$ReservationCopyWithImpl<_Reservation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReservationToJson(this);
  }
}

abstract class _Reservation implements Reservation {
  factory _Reservation(
      {int? id,
      @JsonKey(name: 'is_pre_paid', fromJson: _fromBoolJsone, toJson: _toBoolJsone)
          bool? isPrePaId,
      @JsonKey(name: 'start_time', fromJson: _fromJson, toJson: _toJson)
          DateTime? startTime,
      @JsonKey(name: 'end_time', fromJson: _fromJson, toJson: _toJson)
          DateTime? endTime,
      @JsonKey(name: 'room_id')
          required int roomId,
      @JsonKey(name: 'course_id')
          int? courseId,
      @JsonKey(name: 'guest_id')
          required int guestId}) = _$_Reservation;

  factory _Reservation.fromJson(Map<String, dynamic> json) =
      _$_Reservation.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'is_pre_paid', fromJson: _fromBoolJsone, toJson: _toBoolJsone)
  bool? get isPrePaId;
  @override // Date time data
  @JsonKey(name: 'start_time', fromJson: _fromJson, toJson: _toJson)
  DateTime? get startTime;
  @override
  @JsonKey(name: 'end_time', fromJson: _fromJson, toJson: _toJson)
  DateTime? get endTime;
  @override // Refrensaces
  @JsonKey(name: 'room_id')
  int get roomId;
  @override
  @JsonKey(name: 'course_id')
  int? get courseId;
  @override
  @JsonKey(name: 'guest_id')
  int get guestId;
  @override
  @JsonKey(ignore: true)
  _$ReservationCopyWith<_Reservation> get copyWith =>
      throw _privateConstructorUsedError;
}
