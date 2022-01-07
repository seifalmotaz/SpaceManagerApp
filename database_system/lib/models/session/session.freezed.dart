// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'session.dart';

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
      int? guestId,
      int? priceId,
      double? paidAmount,
      int? guestCount,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeOut}) {
    return _Session(
      id: id,
      guestId: guestId,
      priceId: priceId,
      paidAmount: paidAmount,
      guestCount: guestCount,
      timeIn: timeIn,
      timeOut: timeOut,
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
  int? get id => throw _privateConstructorUsedError; // pricing data
  int? get guestId => throw _privateConstructorUsedError;
  int? get priceId => throw _privateConstructorUsedError;
  double? get paidAmount => throw _privateConstructorUsedError; // extra info
  int? get guestCount => throw _privateConstructorUsedError; // main data
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get timeIn => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get timeOut => throw _privateConstructorUsedError;

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
      int? guestId,
      int? priceId,
      double? paidAmount,
      int? guestCount,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeOut});
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
    Object? guestId = freezed,
    Object? priceId = freezed,
    Object? paidAmount = freezed,
    Object? guestCount = freezed,
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
      priceId: priceId == freezed
          ? _value.priceId
          : priceId // ignore: cast_nullable_to_non_nullable
              as int?,
      paidAmount: paidAmount == freezed
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      guestCount: guestCount == freezed
          ? _value.guestCount
          : guestCount // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$SessionCopyWith(_Session value, $Res Function(_Session) then) =
      __$SessionCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      int? guestId,
      int? priceId,
      double? paidAmount,
      int? guestCount,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeOut});
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
    Object? guestId = freezed,
    Object? priceId = freezed,
    Object? paidAmount = freezed,
    Object? guestCount = freezed,
    Object? timeIn = freezed,
    Object? timeOut = freezed,
  }) {
    return _then(_Session(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      guestId: guestId == freezed
          ? _value.guestId
          : guestId // ignore: cast_nullable_to_non_nullable
              as int?,
      priceId: priceId == freezed
          ? _value.priceId
          : priceId // ignore: cast_nullable_to_non_nullable
              as int?,
      paidAmount: paidAmount == freezed
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      guestCount: guestCount == freezed
          ? _value.guestCount
          : guestCount // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$_Session implements _Session {
  _$_Session(
      {this.id,
      this.guestId,
      this.priceId,
      this.paidAmount,
      this.guestCount,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          this.timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          this.timeOut});

  factory _$_Session.fromJson(Map<String, dynamic> json) =>
      _$$_SessionFromJson(json);

  @override
  final int? id;
  @override // pricing data
  final int? guestId;
  @override
  final int? priceId;
  @override
  final double? paidAmount;
  @override // extra info
  final int? guestCount;
  @override // main data
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  final DateTime? timeIn;
  @override
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  final DateTime? timeOut;

  @override
  String toString() {
    return 'Session(id: $id, guestId: $guestId, priceId: $priceId, paidAmount: $paidAmount, guestCount: $guestCount, timeIn: $timeIn, timeOut: $timeOut)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Session &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.guestId, guestId) &&
            const DeepCollectionEquality().equals(other.priceId, priceId) &&
            const DeepCollectionEquality()
                .equals(other.paidAmount, paidAmount) &&
            const DeepCollectionEquality()
                .equals(other.guestCount, guestCount) &&
            const DeepCollectionEquality().equals(other.timeIn, timeIn) &&
            const DeepCollectionEquality().equals(other.timeOut, timeOut));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(guestId),
      const DeepCollectionEquality().hash(priceId),
      const DeepCollectionEquality().hash(paidAmount),
      const DeepCollectionEquality().hash(guestCount),
      const DeepCollectionEquality().hash(timeIn),
      const DeepCollectionEquality().hash(timeOut));

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
      int? guestId,
      int? priceId,
      double? paidAmount,
      int? guestCount,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeOut}) = _$_Session;

  factory _Session.fromJson(Map<String, dynamic> json) = _$_Session.fromJson;

  @override
  int? get id;
  @override // pricing data
  int? get guestId;
  @override
  int? get priceId;
  @override
  double? get paidAmount;
  @override // extra info
  int? get guestCount;
  @override // main data
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get timeIn;
  @override
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get timeOut;
  @override
  @JsonKey(ignore: true)
  _$SessionCopyWith<_Session> get copyWith =>
      throw _privateConstructorUsedError;
}
