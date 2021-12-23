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

Guest _$GuestFromJson(Map<String, dynamic> json) {
  return _Guest.fromJson(json);
}

/// @nodoc
class _$GuestTearOff {
  const _$GuestTearOff();

  _Guest call(
      {int? id,
      String? name,
      String? phone,
      String? email,
      String? gender,
      String? career,
      String? nationalId,
      String? nationalIdPic,
      String? password,
      @JsonKey(fromJson: _fromBoolJsone, toJson: _toBoolJsone)
          bool? isAdmin,
      @JsonKey(fromJson: _fromBoolJsone, toJson: _toBoolJsone)
          bool? isStaff,
      @JsonKey(name: 'created_date', fromJson: _fromDateJson, toJson: _toDateJson)
          DateTime? createdDate}) {
    return _Guest(
      id: id,
      name: name,
      phone: phone,
      email: email,
      gender: gender,
      career: career,
      nationalId: nationalId,
      nationalIdPic: nationalIdPic,
      password: password,
      isAdmin: isAdmin,
      isStaff: isStaff,
      createdDate: createdDate,
    );
  }

  Guest fromJson(Map<String, Object?> json) {
    return Guest.fromJson(json);
  }
}

/// @nodoc
const $Guest = _$GuestTearOff();

/// @nodoc
mixin _$Guest {
  int? get id => throw _privateConstructorUsedError; // Info data
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get career => throw _privateConstructorUsedError; // Extra data
  String? get nationalId => throw _privateConstructorUsedError;
  String? get nationalIdPic => throw _privateConstructorUsedError; // Auth data
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _fromBoolJsone, toJson: _toBoolJsone)
  bool? get isAdmin => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _fromBoolJsone, toJson: _toBoolJsone)
  bool? get isStaff => throw _privateConstructorUsedError; // Date time data
  @JsonKey(name: 'created_date', fromJson: _fromDateJson, toJson: _toDateJson)
  DateTime? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuestCopyWith<Guest> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestCopyWith<$Res> {
  factory $GuestCopyWith(Guest value, $Res Function(Guest) then) =
      _$GuestCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      String? phone,
      String? email,
      String? gender,
      String? career,
      String? nationalId,
      String? nationalIdPic,
      String? password,
      @JsonKey(fromJson: _fromBoolJsone, toJson: _toBoolJsone)
          bool? isAdmin,
      @JsonKey(fromJson: _fromBoolJsone, toJson: _toBoolJsone)
          bool? isStaff,
      @JsonKey(name: 'created_date', fromJson: _fromDateJson, toJson: _toDateJson)
          DateTime? createdDate});
}

/// @nodoc
class _$GuestCopyWithImpl<$Res> implements $GuestCopyWith<$Res> {
  _$GuestCopyWithImpl(this._value, this._then);

  final Guest _value;
  // ignore: unused_field
  final $Res Function(Guest) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? career = freezed,
    Object? nationalId = freezed,
    Object? nationalIdPic = freezed,
    Object? password = freezed,
    Object? isAdmin = freezed,
    Object? isStaff = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      career: career == freezed
          ? _value.career
          : career // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalId: nationalId == freezed
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalIdPic: nationalIdPic == freezed
          ? _value.nationalIdPic
          : nationalIdPic // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      isAdmin: isAdmin == freezed
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isStaff: isStaff == freezed
          ? _value.isStaff
          : isStaff // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$GuestCopyWith<$Res> implements $GuestCopyWith<$Res> {
  factory _$GuestCopyWith(_Guest value, $Res Function(_Guest) then) =
      __$GuestCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      String? phone,
      String? email,
      String? gender,
      String? career,
      String? nationalId,
      String? nationalIdPic,
      String? password,
      @JsonKey(fromJson: _fromBoolJsone, toJson: _toBoolJsone)
          bool? isAdmin,
      @JsonKey(fromJson: _fromBoolJsone, toJson: _toBoolJsone)
          bool? isStaff,
      @JsonKey(name: 'created_date', fromJson: _fromDateJson, toJson: _toDateJson)
          DateTime? createdDate});
}

/// @nodoc
class __$GuestCopyWithImpl<$Res> extends _$GuestCopyWithImpl<$Res>
    implements _$GuestCopyWith<$Res> {
  __$GuestCopyWithImpl(_Guest _value, $Res Function(_Guest) _then)
      : super(_value, (v) => _then(v as _Guest));

  @override
  _Guest get _value => super._value as _Guest;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? career = freezed,
    Object? nationalId = freezed,
    Object? nationalIdPic = freezed,
    Object? password = freezed,
    Object? isAdmin = freezed,
    Object? isStaff = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_Guest(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      career: career == freezed
          ? _value.career
          : career // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalId: nationalId == freezed
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalIdPic: nationalIdPic == freezed
          ? _value.nationalIdPic
          : nationalIdPic // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      isAdmin: isAdmin == freezed
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isStaff: isStaff == freezed
          ? _value.isStaff
          : isStaff // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Guest implements _Guest {
  _$_Guest(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.gender,
      this.career,
      this.nationalId,
      this.nationalIdPic,
      this.password,
      @JsonKey(fromJson: _fromBoolJsone, toJson: _toBoolJsone)
          this.isAdmin,
      @JsonKey(fromJson: _fromBoolJsone, toJson: _toBoolJsone)
          this.isStaff,
      @JsonKey(name: 'created_date', fromJson: _fromDateJson, toJson: _toDateJson)
          this.createdDate});

  factory _$_Guest.fromJson(Map<String, dynamic> json) =>
      _$$_GuestFromJson(json);

  @override
  final int? id;
  @override // Info data
  final String? name;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? gender;
  @override
  final String? career;
  @override // Extra data
  final String? nationalId;
  @override
  final String? nationalIdPic;
  @override // Auth data
  final String? password;
  @override
  @JsonKey(fromJson: _fromBoolJsone, toJson: _toBoolJsone)
  final bool? isAdmin;
  @override
  @JsonKey(fromJson: _fromBoolJsone, toJson: _toBoolJsone)
  final bool? isStaff;
  @override // Date time data
  @JsonKey(name: 'created_date', fromJson: _fromDateJson, toJson: _toDateJson)
  final DateTime? createdDate;

  @override
  String toString() {
    return 'Guest(id: $id, name: $name, phone: $phone, email: $email, gender: $gender, career: $career, nationalId: $nationalId, nationalIdPic: $nationalIdPic, password: $password, isAdmin: $isAdmin, isStaff: $isStaff, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Guest &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.career, career) &&
            const DeepCollectionEquality()
                .equals(other.nationalId, nationalId) &&
            const DeepCollectionEquality()
                .equals(other.nationalIdPic, nationalIdPic) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.isAdmin, isAdmin) &&
            const DeepCollectionEquality().equals(other.isStaff, isStaff) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(career),
      const DeepCollectionEquality().hash(nationalId),
      const DeepCollectionEquality().hash(nationalIdPic),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(isAdmin),
      const DeepCollectionEquality().hash(isStaff),
      const DeepCollectionEquality().hash(createdDate));

  @JsonKey(ignore: true)
  @override
  _$GuestCopyWith<_Guest> get copyWith =>
      __$GuestCopyWithImpl<_Guest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GuestToJson(this);
  }
}

abstract class _Guest implements Guest {
  factory _Guest(
      {int? id,
      String? name,
      String? phone,
      String? email,
      String? gender,
      String? career,
      String? nationalId,
      String? nationalIdPic,
      String? password,
      @JsonKey(fromJson: _fromBoolJsone, toJson: _toBoolJsone)
          bool? isAdmin,
      @JsonKey(fromJson: _fromBoolJsone, toJson: _toBoolJsone)
          bool? isStaff,
      @JsonKey(name: 'created_date', fromJson: _fromDateJson, toJson: _toDateJson)
          DateTime? createdDate}) = _$_Guest;

  factory _Guest.fromJson(Map<String, dynamic> json) = _$_Guest.fromJson;

  @override
  int? get id;
  @override // Info data
  String? get name;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get gender;
  @override
  String? get career;
  @override // Extra data
  String? get nationalId;
  @override
  String? get nationalIdPic;
  @override // Auth data
  String? get password;
  @override
  @JsonKey(fromJson: _fromBoolJsone, toJson: _toBoolJsone)
  bool? get isAdmin;
  @override
  @JsonKey(fromJson: _fromBoolJsone, toJson: _toBoolJsone)
  bool? get isStaff;
  @override // Date time data
  @JsonKey(name: 'created_date', fromJson: _fromDateJson, toJson: _toDateJson)
  DateTime? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$GuestCopyWith<_Guest> get copyWith => throw _privateConstructorUsedError;
}
