// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'course_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CourseRegistration _$CourseRegistrationFromJson(Map<String, dynamic> json) {
  return _CourseRegistration.fromJson(json);
}

/// @nodoc
class _$CourseRegistrationTearOff {
  const _$CourseRegistrationTearOff();

  _CourseRegistration call(
      {int? id,
      int? guestId,
      int? courseId,
      @JsonKey(fromJson: DataCompiler.fromDBool, toJson: DataCompiler.toDBool)
          bool? isPaid,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? createdDate}) {
    return _CourseRegistration(
      id: id,
      guestId: guestId,
      courseId: courseId,
      isPaid: isPaid,
      createdDate: createdDate,
    );
  }

  CourseRegistration fromJson(Map<String, Object?> json) {
    return CourseRegistration.fromJson(json);
  }
}

/// @nodoc
const $CourseRegistration = _$CourseRegistrationTearOff();

/// @nodoc
mixin _$CourseRegistration {
  int? get id => throw _privateConstructorUsedError;
  int? get guestId => throw _privateConstructorUsedError;
  int? get courseId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DataCompiler.fromDBool, toJson: DataCompiler.toDBool)
  bool? get isPaid => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseRegistrationCopyWith<CourseRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseRegistrationCopyWith<$Res> {
  factory $CourseRegistrationCopyWith(
          CourseRegistration value, $Res Function(CourseRegistration) then) =
      _$CourseRegistrationCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      int? guestId,
      int? courseId,
      @JsonKey(fromJson: DataCompiler.fromDBool, toJson: DataCompiler.toDBool)
          bool? isPaid,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? createdDate});
}

/// @nodoc
class _$CourseRegistrationCopyWithImpl<$Res>
    implements $CourseRegistrationCopyWith<$Res> {
  _$CourseRegistrationCopyWithImpl(this._value, this._then);

  final CourseRegistration _value;
  // ignore: unused_field
  final $Res Function(CourseRegistration) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? guestId = freezed,
    Object? courseId = freezed,
    Object? isPaid = freezed,
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
      courseId: courseId == freezed
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      isPaid: isPaid == freezed
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$CourseRegistrationCopyWith<$Res>
    implements $CourseRegistrationCopyWith<$Res> {
  factory _$CourseRegistrationCopyWith(
          _CourseRegistration value, $Res Function(_CourseRegistration) then) =
      __$CourseRegistrationCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      int? guestId,
      int? courseId,
      @JsonKey(fromJson: DataCompiler.fromDBool, toJson: DataCompiler.toDBool)
          bool? isPaid,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? createdDate});
}

/// @nodoc
class __$CourseRegistrationCopyWithImpl<$Res>
    extends _$CourseRegistrationCopyWithImpl<$Res>
    implements _$CourseRegistrationCopyWith<$Res> {
  __$CourseRegistrationCopyWithImpl(
      _CourseRegistration _value, $Res Function(_CourseRegistration) _then)
      : super(_value, (v) => _then(v as _CourseRegistration));

  @override
  _CourseRegistration get _value => super._value as _CourseRegistration;

  @override
  $Res call({
    Object? id = freezed,
    Object? guestId = freezed,
    Object? courseId = freezed,
    Object? isPaid = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_CourseRegistration(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      guestId: guestId == freezed
          ? _value.guestId
          : guestId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseId: courseId == freezed
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      isPaid: isPaid == freezed
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_CourseRegistration implements _CourseRegistration {
  _$_CourseRegistration(
      {this.id,
      this.guestId,
      this.courseId,
      @JsonKey(fromJson: DataCompiler.fromDBool, toJson: DataCompiler.toDBool)
          this.isPaid,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          this.createdDate});

  factory _$_CourseRegistration.fromJson(Map<String, dynamic> json) =>
      _$$_CourseRegistrationFromJson(json);

  @override
  final int? id;
  @override
  final int? guestId;
  @override
  final int? courseId;
  @override
  @JsonKey(fromJson: DataCompiler.fromDBool, toJson: DataCompiler.toDBool)
  final bool? isPaid;
  @override
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  final DateTime? createdDate;

  @override
  String toString() {
    return 'CourseRegistration(id: $id, guestId: $guestId, courseId: $courseId, isPaid: $isPaid, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseRegistration &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.guestId, guestId) &&
            const DeepCollectionEquality().equals(other.courseId, courseId) &&
            const DeepCollectionEquality().equals(other.isPaid, isPaid) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(guestId),
      const DeepCollectionEquality().hash(courseId),
      const DeepCollectionEquality().hash(isPaid),
      const DeepCollectionEquality().hash(createdDate));

  @JsonKey(ignore: true)
  @override
  _$CourseRegistrationCopyWith<_CourseRegistration> get copyWith =>
      __$CourseRegistrationCopyWithImpl<_CourseRegistration>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseRegistrationToJson(this);
  }
}

abstract class _CourseRegistration implements CourseRegistration {
  factory _CourseRegistration(
      {int? id,
      int? guestId,
      int? courseId,
      @JsonKey(fromJson: DataCompiler.fromDBool, toJson: DataCompiler.toDBool)
          bool? isPaid,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? createdDate}) = _$_CourseRegistration;

  factory _CourseRegistration.fromJson(Map<String, dynamic> json) =
      _$_CourseRegistration.fromJson;

  @override
  int? get id;
  @override
  int? get guestId;
  @override
  int? get courseId;
  @override
  @JsonKey(fromJson: DataCompiler.fromDBool, toJson: DataCompiler.toDBool)
  bool? get isPaid;
  @override
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$CourseRegistrationCopyWith<_CourseRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}
