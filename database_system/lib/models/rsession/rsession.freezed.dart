// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rsession.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RSession _$RSessionFromJson(Map<String, dynamic> json) {
  return _RSession.fromJson(json);
}

/// @nodoc
class _$RSessionTearOff {
  const _$RSessionTearOff();

  _RSession call(
      {int? id,
      int? guestId,
      int? roomId,
      double? paidAmount,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeOut}) {
    return _RSession(
      id: id,
      guestId: guestId,
      roomId: roomId,
      paidAmount: paidAmount,
      timeIn: timeIn,
      timeOut: timeOut,
    );
  }

  RSession fromJson(Map<String, Object?> json) {
    return RSession.fromJson(json);
  }
}

/// @nodoc
const $RSession = _$RSessionTearOff();

/// @nodoc
mixin _$RSession {
  int? get id => throw _privateConstructorUsedError; // pricing data
  int? get guestId => throw _privateConstructorUsedError;
  int? get roomId => throw _privateConstructorUsedError;
  double? get paidAmount => throw _privateConstructorUsedError; // main data
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get timeIn => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get timeOut => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RSessionCopyWith<RSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RSessionCopyWith<$Res> {
  factory $RSessionCopyWith(RSession value, $Res Function(RSession) then) =
      _$RSessionCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      int? guestId,
      int? roomId,
      double? paidAmount,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeOut});
}

/// @nodoc
class _$RSessionCopyWithImpl<$Res> implements $RSessionCopyWith<$Res> {
  _$RSessionCopyWithImpl(this._value, this._then);

  final RSession _value;
  // ignore: unused_field
  final $Res Function(RSession) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? guestId = freezed,
    Object? roomId = freezed,
    Object? paidAmount = freezed,
    Object? timeIn = freezed,
    Object? timeOut = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$RSessionCopyWith<$Res> implements $RSessionCopyWith<$Res> {
  factory _$RSessionCopyWith(_RSession value, $Res Function(_RSession) then) =
      __$RSessionCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      int? guestId,
      int? roomId,
      double? paidAmount,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeOut});
}

/// @nodoc
class __$RSessionCopyWithImpl<$Res> extends _$RSessionCopyWithImpl<$Res>
    implements _$RSessionCopyWith<$Res> {
  __$RSessionCopyWithImpl(_RSession _value, $Res Function(_RSession) _then)
      : super(_value, (v) => _then(v as _RSession));

  @override
  _RSession get _value => super._value as _RSession;

  @override
  $Res call({
    Object? id = freezed,
    Object? guestId = freezed,
    Object? roomId = freezed,
    Object? paidAmount = freezed,
    Object? timeIn = freezed,
    Object? timeOut = freezed,
  }) {
    return _then(_RSession(
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
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_RSession implements _RSession {
  _$_RSession(
      {this.id,
      this.guestId,
      this.roomId,
      this.paidAmount,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          this.timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          this.timeOut});

  factory _$_RSession.fromJson(Map<String, dynamic> json) =>
      _$$_RSessionFromJson(json);

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
  String toString() {
    return 'RSession(id: $id, guestId: $guestId, roomId: $roomId, paidAmount: $paidAmount, timeIn: $timeIn, timeOut: $timeOut)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RSession &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.guestId, guestId) &&
            const DeepCollectionEquality().equals(other.roomId, roomId) &&
            const DeepCollectionEquality()
                .equals(other.paidAmount, paidAmount) &&
            const DeepCollectionEquality().equals(other.timeIn, timeIn) &&
            const DeepCollectionEquality().equals(other.timeOut, timeOut));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(guestId),
      const DeepCollectionEquality().hash(roomId),
      const DeepCollectionEquality().hash(paidAmount),
      const DeepCollectionEquality().hash(timeIn),
      const DeepCollectionEquality().hash(timeOut));

  @JsonKey(ignore: true)
  @override
  _$RSessionCopyWith<_RSession> get copyWith =>
      __$RSessionCopyWithImpl<_RSession>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RSessionToJson(this);
  }
}

abstract class _RSession implements RSession {
  factory _RSession(
      {int? id,
      int? guestId,
      int? roomId,
      double? paidAmount,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeOut}) = _$_RSession;

  factory _RSession.fromJson(Map<String, dynamic> json) = _$_RSession.fromJson;

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
  @JsonKey(ignore: true)
  _$RSessionCopyWith<_RSession> get copyWith =>
      throw _privateConstructorUsedError;
}
