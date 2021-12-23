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

Bill _$BillFromJson(Map<String, dynamic> json) {
  return _Bill.fromJson(json);
}

/// @nodoc
class _$BillTearOff {
  const _$BillTearOff();

  _Bill call(
      {required int id,
      required double total,
      @JsonKey(name: 'staff_id') required int staffId,
      @JsonKey(name: 'session_id') required int sessionId,
      @JsonKey(name: 'reservation_id') required int reservationId}) {
    return _Bill(
      id: id,
      total: total,
      staffId: staffId,
      sessionId: sessionId,
      reservationId: reservationId,
    );
  }

  Bill fromJson(Map<String, Object?> json) {
    return Bill.fromJson(json);
  }
}

/// @nodoc
const $Bill = _$BillTearOff();

/// @nodoc
mixin _$Bill {
  int get id => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'staff_id')
  int get staffId => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_id')
  int get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'reservation_id')
  int get reservationId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillCopyWith<Bill> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillCopyWith<$Res> {
  factory $BillCopyWith(Bill value, $Res Function(Bill) then) =
      _$BillCopyWithImpl<$Res>;
  $Res call(
      {int id,
      double total,
      @JsonKey(name: 'staff_id') int staffId,
      @JsonKey(name: 'session_id') int sessionId,
      @JsonKey(name: 'reservation_id') int reservationId});
}

/// @nodoc
class _$BillCopyWithImpl<$Res> implements $BillCopyWith<$Res> {
  _$BillCopyWithImpl(this._value, this._then);

  final Bill _value;
  // ignore: unused_field
  final $Res Function(Bill) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? total = freezed,
    Object? staffId = freezed,
    Object? sessionId = freezed,
    Object? reservationId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      staffId: staffId == freezed
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as int,
      sessionId: sessionId == freezed
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as int,
      reservationId: reservationId == freezed
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$BillCopyWith<$Res> implements $BillCopyWith<$Res> {
  factory _$BillCopyWith(_Bill value, $Res Function(_Bill) then) =
      __$BillCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      double total,
      @JsonKey(name: 'staff_id') int staffId,
      @JsonKey(name: 'session_id') int sessionId,
      @JsonKey(name: 'reservation_id') int reservationId});
}

/// @nodoc
class __$BillCopyWithImpl<$Res> extends _$BillCopyWithImpl<$Res>
    implements _$BillCopyWith<$Res> {
  __$BillCopyWithImpl(_Bill _value, $Res Function(_Bill) _then)
      : super(_value, (v) => _then(v as _Bill));

  @override
  _Bill get _value => super._value as _Bill;

  @override
  $Res call({
    Object? id = freezed,
    Object? total = freezed,
    Object? staffId = freezed,
    Object? sessionId = freezed,
    Object? reservationId = freezed,
  }) {
    return _then(_Bill(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      staffId: staffId == freezed
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as int,
      sessionId: sessionId == freezed
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as int,
      reservationId: reservationId == freezed
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Bill implements _Bill {
  _$_Bill(
      {required this.id,
      required this.total,
      @JsonKey(name: 'staff_id') required this.staffId,
      @JsonKey(name: 'session_id') required this.sessionId,
      @JsonKey(name: 'reservation_id') required this.reservationId});

  factory _$_Bill.fromJson(Map<String, dynamic> json) => _$$_BillFromJson(json);

  @override
  final int id;
  @override
  final double total;
  @override
  @JsonKey(name: 'staff_id')
  final int staffId;
  @override
  @JsonKey(name: 'session_id')
  final int sessionId;
  @override
  @JsonKey(name: 'reservation_id')
  final int reservationId;

  @override
  String toString() {
    return 'Bill(id: $id, total: $total, staffId: $staffId, sessionId: $sessionId, reservationId: $reservationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Bill &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.staffId, staffId) &&
            const DeepCollectionEquality().equals(other.sessionId, sessionId) &&
            const DeepCollectionEquality()
                .equals(other.reservationId, reservationId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(staffId),
      const DeepCollectionEquality().hash(sessionId),
      const DeepCollectionEquality().hash(reservationId));

  @JsonKey(ignore: true)
  @override
  _$BillCopyWith<_Bill> get copyWith =>
      __$BillCopyWithImpl<_Bill>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BillToJson(this);
  }
}

abstract class _Bill implements Bill {
  factory _Bill(
      {required int id,
      required double total,
      @JsonKey(name: 'staff_id') required int staffId,
      @JsonKey(name: 'session_id') required int sessionId,
      @JsonKey(name: 'reservation_id') required int reservationId}) = _$_Bill;

  factory _Bill.fromJson(Map<String, dynamic> json) = _$_Bill.fromJson;

  @override
  int get id;
  @override
  double get total;
  @override
  @JsonKey(name: 'staff_id')
  int get staffId;
  @override
  @JsonKey(name: 'session_id')
  int get sessionId;
  @override
  @JsonKey(name: 'reservation_id')
  int get reservationId;
  @override
  @JsonKey(ignore: true)
  _$BillCopyWith<_Bill> get copyWith => throw _privateConstructorUsedError;
}
