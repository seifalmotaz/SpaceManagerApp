// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'creservation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CReservation _$CReservationFromJson(Map<String, dynamic> json) {
  return _CReservation.fromJson(json);
}

/// @nodoc
class _$CReservationTearOff {
  const _$CReservationTearOff();

  _CReservation call(
      {int? id,
      int? courseId,
      int? roomId,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeOut,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? createdDate}) {
    return _CReservation(
      id: id,
      courseId: courseId,
      roomId: roomId,
      timeIn: timeIn,
      timeOut: timeOut,
      createdDate: createdDate,
    );
  }

  CReservation fromJson(Map<String, Object?> json) {
    return CReservation.fromJson(json);
  }
}

/// @nodoc
const $CReservation = _$CReservationTearOff();

/// @nodoc
mixin _$CReservation {
  int? get id => throw _privateConstructorUsedError; // pricing data
  int? get courseId => throw _privateConstructorUsedError;
  int? get roomId => throw _privateConstructorUsedError; // main data
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get timeIn => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get timeOut => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CReservationCopyWith<CReservation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CReservationCopyWith<$Res> {
  factory $CReservationCopyWith(
          CReservation value, $Res Function(CReservation) then) =
      _$CReservationCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      int? courseId,
      int? roomId,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeOut,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? createdDate});
}

/// @nodoc
class _$CReservationCopyWithImpl<$Res> implements $CReservationCopyWith<$Res> {
  _$CReservationCopyWithImpl(this._value, this._then);

  final CReservation _value;
  // ignore: unused_field
  final $Res Function(CReservation) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = freezed,
    Object? roomId = freezed,
    Object? timeIn = freezed,
    Object? timeOut = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      courseId: courseId == freezed
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      roomId: roomId == freezed
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$CReservationCopyWith<$Res>
    implements $CReservationCopyWith<$Res> {
  factory _$CReservationCopyWith(
          _CReservation value, $Res Function(_CReservation) then) =
      __$CReservationCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      int? courseId,
      int? roomId,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeOut,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? createdDate});
}

/// @nodoc
class __$CReservationCopyWithImpl<$Res> extends _$CReservationCopyWithImpl<$Res>
    implements _$CReservationCopyWith<$Res> {
  __$CReservationCopyWithImpl(
      _CReservation _value, $Res Function(_CReservation) _then)
      : super(_value, (v) => _then(v as _CReservation));

  @override
  _CReservation get _value => super._value as _CReservation;

  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = freezed,
    Object? roomId = freezed,
    Object? timeIn = freezed,
    Object? timeOut = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_CReservation(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      courseId: courseId == freezed
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      roomId: roomId == freezed
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$_CReservation implements _CReservation {
  _$_CReservation(
      {this.id,
      this.courseId,
      this.roomId,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          this.timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          this.timeOut,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          this.createdDate});

  factory _$_CReservation.fromJson(Map<String, dynamic> json) =>
      _$$_CReservationFromJson(json);

  @override
  final int? id;
  @override // pricing data
  final int? courseId;
  @override
  final int? roomId;
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
    return 'CReservation(id: $id, courseId: $courseId, roomId: $roomId, timeIn: $timeIn, timeOut: $timeOut, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CReservation &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.courseId, courseId) &&
            const DeepCollectionEquality().equals(other.roomId, roomId) &&
            const DeepCollectionEquality().equals(other.timeIn, timeIn) &&
            const DeepCollectionEquality().equals(other.timeOut, timeOut) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(courseId),
      const DeepCollectionEquality().hash(roomId),
      const DeepCollectionEquality().hash(timeIn),
      const DeepCollectionEquality().hash(timeOut),
      const DeepCollectionEquality().hash(createdDate));

  @JsonKey(ignore: true)
  @override
  _$CReservationCopyWith<_CReservation> get copyWith =>
      __$CReservationCopyWithImpl<_CReservation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CReservationToJson(this);
  }
}

abstract class _CReservation implements CReservation {
  factory _CReservation(
      {int? id,
      int? courseId,
      int? roomId,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeIn,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? timeOut,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? createdDate}) = _$_CReservation;

  factory _CReservation.fromJson(Map<String, dynamic> json) =
      _$_CReservation.fromJson;

  @override
  int? get id;
  @override // pricing data
  int? get courseId;
  @override
  int? get roomId;
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
  _$CReservationCopyWith<_CReservation> get copyWith =>
      throw _privateConstructorUsedError;
}
