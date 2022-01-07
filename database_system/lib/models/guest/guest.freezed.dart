// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'guest.dart';

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
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? createdDate,
      bool? isExpired,
      String? name,
      String? email,
      String? phone,
      String? password,
      bool? isAdmin,
      bool? isStaff,
      String? nationalID,
      String? nationalIdPic}) {
    return _Guest(
      id: id,
      createdDate: createdDate,
      isExpired: isExpired,
      name: name,
      email: email,
      phone: phone,
      password: password,
      isAdmin: isAdmin,
      isStaff: isStaff,
      nationalID: nationalID,
      nationalIdPic: nationalIdPic,
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
// Main data
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get createdDate => throw _privateConstructorUsedError;
  bool? get isExpired => throw _privateConstructorUsedError; // main info data
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError; // auth data
  String? get password => throw _privateConstructorUsedError;
  bool? get isAdmin => throw _privateConstructorUsedError;
  bool? get isStaff => throw _privateConstructorUsedError; // National ID data
  String? get nationalID => throw _privateConstructorUsedError;
  String? get nationalIdPic => throw _privateConstructorUsedError;

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
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? createdDate,
      bool? isExpired,
      String? name,
      String? email,
      String? phone,
      String? password,
      bool? isAdmin,
      bool? isStaff,
      String? nationalID,
      String? nationalIdPic});
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
    Object? createdDate = freezed,
    Object? isExpired = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? password = freezed,
    Object? isAdmin = freezed,
    Object? isStaff = freezed,
    Object? nationalID = freezed,
    Object? nationalIdPic = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isExpired: isExpired == freezed
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
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
      nationalID: nationalID == freezed
          ? _value.nationalID
          : nationalID // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalIdPic: nationalIdPic == freezed
          ? _value.nationalIdPic
          : nationalIdPic // ignore: cast_nullable_to_non_nullable
              as String?,
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
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? createdDate,
      bool? isExpired,
      String? name,
      String? email,
      String? phone,
      String? password,
      bool? isAdmin,
      bool? isStaff,
      String? nationalID,
      String? nationalIdPic});
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
    Object? createdDate = freezed,
    Object? isExpired = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? password = freezed,
    Object? isAdmin = freezed,
    Object? isStaff = freezed,
    Object? nationalID = freezed,
    Object? nationalIdPic = freezed,
  }) {
    return _then(_Guest(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isExpired: isExpired == freezed
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
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
      nationalID: nationalID == freezed
          ? _value.nationalID
          : nationalID // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalIdPic: nationalIdPic == freezed
          ? _value.nationalIdPic
          : nationalIdPic // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Guest implements _Guest {
  _$_Guest(
      {this.id,
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          this.createdDate,
      this.isExpired,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.isAdmin,
      this.isStaff,
      this.nationalID,
      this.nationalIdPic});

  factory _$_Guest.fromJson(Map<String, dynamic> json) =>
      _$$_GuestFromJson(json);

  @override // Main data
  final int? id;
  @override
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  final DateTime? createdDate;
  @override
  final bool? isExpired;
  @override // main info data
  final String? name;
  @override
  final String? email;
  @override
  final String? phone;
  @override // auth data
  final String? password;
  @override
  final bool? isAdmin;
  @override
  final bool? isStaff;
  @override // National ID data
  final String? nationalID;
  @override
  final String? nationalIdPic;

  @override
  String toString() {
    return 'Guest(id: $id, createdDate: $createdDate, isExpired: $isExpired, name: $name, email: $email, phone: $phone, password: $password, isAdmin: $isAdmin, isStaff: $isStaff, nationalID: $nationalID, nationalIdPic: $nationalIdPic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Guest &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            const DeepCollectionEquality().equals(other.isExpired, isExpired) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.isAdmin, isAdmin) &&
            const DeepCollectionEquality().equals(other.isStaff, isStaff) &&
            const DeepCollectionEquality()
                .equals(other.nationalID, nationalID) &&
            const DeepCollectionEquality()
                .equals(other.nationalIdPic, nationalIdPic));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(createdDate),
      const DeepCollectionEquality().hash(isExpired),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(isAdmin),
      const DeepCollectionEquality().hash(isStaff),
      const DeepCollectionEquality().hash(nationalID),
      const DeepCollectionEquality().hash(nationalIdPic));

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
      @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
          DateTime? createdDate,
      bool? isExpired,
      String? name,
      String? email,
      String? phone,
      String? password,
      bool? isAdmin,
      bool? isStaff,
      String? nationalID,
      String? nationalIdPic}) = _$_Guest;

  factory _Guest.fromJson(Map<String, dynamic> json) = _$_Guest.fromJson;

  @override // Main data
  int? get id;
  @override
  @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
  DateTime? get createdDate;
  @override
  bool? get isExpired;
  @override // main info data
  String? get name;
  @override
  String? get email;
  @override
  String? get phone;
  @override // auth data
  String? get password;
  @override
  bool? get isAdmin;
  @override
  bool? get isStaff;
  @override // National ID data
  String? get nationalID;
  @override
  String? get nationalIdPic;
  @override
  @JsonKey(ignore: true)
  _$GuestCopyWith<_Guest> get copyWith => throw _privateConstructorUsedError;
}
