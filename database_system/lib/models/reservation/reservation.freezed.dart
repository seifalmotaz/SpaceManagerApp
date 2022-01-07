// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reservation.dart';

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
      int? guestId,
      int? roomId,
      double? paidAmount,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeOut,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? createdDate}) {
    return _Reservation(
      id: id,
      guestId: guestId,
      roomId: roomId,
      paidAmount: paidAmount,
      timeIn: timeIn,
      timeOut: timeOut,
      createdDate: createdDate,
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
  int? get id => throw _privateConstructorUsedError; // pricing data
  int? get guestId => throw _privateConstructorUsedError;
  int? get roomId => throw _privateConstructorUsedError;
  double? get paidAmount => throw _privateConstructorUsedError; // main data
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get timeIn => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get timeOut => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get createdDate => throw _privateConstructorUsedError;

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
      int? guestId,
      int? roomId,
      double? paidAmount,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeOut,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? createdDate});
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
    Object? guestId = freezed,
    Object? roomId = freezed,
    Object? paidAmount = freezed,
    Object? timeIn = freezed,
    Object? timeOut = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      guestId: guestId == freezed
          ? _value.guestId
          : guestId // ignore: cast_nullable_to_non_nullable
              as int?,
      roomId: roomId == freezed
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int?,
      paidAmount: paidAmount == freezed
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      timeIn: timeIn == freezed
          ? _value.timeIn
          : timeIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeOut: timeOut == freezed
          ? _value.timeOut
          : timeOut // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      int? guestId,
      int? roomId,
      double? paidAmount,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeOut,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? createdDate});
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
    Object? guestId = freezed,
    Object? roomId = freezed,
    Object? paidAmount = freezed,
    Object? timeIn = freezed,
    Object? timeOut = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_Reservation(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      guestId: guestId == freezed
          ? _value.guestId
          : guestId // ignore: cast_nullable_to_non_nullable
              as int?,
      roomId: roomId == freezed
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int?,
      paidAmount: paidAmount == freezed
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      timeIn: timeIn == freezed
          ? _value.timeIn
          : timeIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeOut: timeOut == freezed
          ? _value.timeOut
          : timeOut // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Reservation implements _Reservation {
  _$_Reservation(
      {this.id,
      this.guestId,
      this.roomId,
      this.paidAmount,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          this.timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          this.timeOut,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          this.createdDate});

  factory _$_Reservation.fromJson(Map<String, dynamic> json) =>
      _$$_ReservationFromJson(json);

  @override
  final int? id;
  @override // pricing data
  final int? guestId;
  @override
  final int? roomId;
  @override
  final double? paidAmount;
  @override // main data
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  final DateTime? timeIn;
  @override
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  final DateTime? timeOut;
  @override
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  final DateTime? createdDate;

  @override
  String toString() {
    return 'Reservation(id: $id, guestId: $guestId, roomId: $roomId, paidAmount: $paidAmount, timeIn: $timeIn, timeOut: $timeOut, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reservation &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.guestId, guestId) &&
            const DeepCollectionEquality().equals(other.roomId, roomId) &&
            const DeepCollectionEquality()
                .equals(other.paidAmount, paidAmount) &&
            const DeepCollectionEquality().equals(other.timeIn, timeIn) &&
            const DeepCollectionEquality().equals(other.timeOut, timeOut) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(guestId),
      const DeepCollectionEquality().hash(roomId),
      const DeepCollectionEquality().hash(paidAmount),
      const DeepCollectionEquality().hash(timeIn),
      const DeepCollectionEquality().hash(timeOut),
      const DeepCollectionEquality().hash(createdDate));

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
      int? guestId,
      int? roomId,
      double? paidAmount,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeOut,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? createdDate}) = _$_Reservation;

  factory _Reservation.fromJson(Map<String, dynamic> json) =
      _$_Reservation.fromJson;

  @override
  int? get id;
  @override // pricing data
  int? get guestId;
  @override
  int? get roomId;
  @override
  double? get paidAmount;
  @override // main data
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get timeIn;
  @override
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get timeOut;
  @override
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$ReservationCopyWith<_Reservation> get copyWith =>
      throw _privateConstructorUsedError;
}
