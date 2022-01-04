// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Price _$PriceFromJson(Map<String, dynamic> json) {
  return _Price.fromJson(json);
}

/// @nodoc
class _$PriceTearOff {
  const _$PriceTearOff();

  _Price call(
      {required int id,
      required double rate,
      required String description,
      @JsonKey(name: 'is_default', fromJson: _fromDBool, toJson: _toDBool)
          required bool isDefault,
      @JsonKey(name: 'is_deleted', fromJson: _fromDBool, toJson: _toDBool)
          required bool isDeleted,
      @JsonKey(name: 'is_per_day', fromJson: _fromDBool, toJson: _toDBool)
          required bool isPerDay,
      @JsonKey(name: 'created_date', fromJson: _fromDBDate, toJson: _toDBDate)
          required DateTime createdDate}) {
    return _Price(
      id: id,
      rate: rate,
      description: description,
      isDefault: isDefault,
      isDeleted: isDeleted,
      isPerDay: isPerDay,
      createdDate: createdDate,
    );
  }

  Price fromJson(Map<String, Object?> json) {
    return Price.fromJson(json);
  }
}

/// @nodoc
const $Price = _$PriceTearOff();

/// @nodoc
mixin _$Price {
  int get id => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_default', fromJson: _fromDBool, toJson: _toDBool)
  bool get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_deleted', fromJson: _fromDBool, toJson: _toDBool)
  bool get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_per_day', fromJson: _fromDBool, toJson: _toDBool)
  bool get isPerDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_date', fromJson: _fromDBDate, toJson: _toDBDate)
  DateTime get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceCopyWith<Price> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceCopyWith<$Res> {
  factory $PriceCopyWith(Price value, $Res Function(Price) then) =
      _$PriceCopyWithImpl<$Res>;
  $Res call(
      {int id,
      double rate,
      String description,
      @JsonKey(name: 'is_default', fromJson: _fromDBool, toJson: _toDBool)
          bool isDefault,
      @JsonKey(name: 'is_deleted', fromJson: _fromDBool, toJson: _toDBool)
          bool isDeleted,
      @JsonKey(name: 'is_per_day', fromJson: _fromDBool, toJson: _toDBool)
          bool isPerDay,
      @JsonKey(name: 'created_date', fromJson: _fromDBDate, toJson: _toDBDate)
          DateTime createdDate});
}

/// @nodoc
class _$PriceCopyWithImpl<$Res> implements $PriceCopyWith<$Res> {
  _$PriceCopyWithImpl(this._value, this._then);

  final Price _value;
  // ignore: unused_field
  final $Res Function(Price) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? rate = freezed,
    Object? description = freezed,
    Object? isDefault = freezed,
    Object? isDeleted = freezed,
    Object? isPerDay = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: isDefault == freezed
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: isDeleted == freezed
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isPerDay: isPerDay == freezed
          ? _value.isPerDay
          : isPerDay // ignore: cast_nullable_to_non_nullable
              as bool,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$PriceCopyWith<$Res> implements $PriceCopyWith<$Res> {
  factory _$PriceCopyWith(_Price value, $Res Function(_Price) then) =
      __$PriceCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      double rate,
      String description,
      @JsonKey(name: 'is_default', fromJson: _fromDBool, toJson: _toDBool)
          bool isDefault,
      @JsonKey(name: 'is_deleted', fromJson: _fromDBool, toJson: _toDBool)
          bool isDeleted,
      @JsonKey(name: 'is_per_day', fromJson: _fromDBool, toJson: _toDBool)
          bool isPerDay,
      @JsonKey(name: 'created_date', fromJson: _fromDBDate, toJson: _toDBDate)
          DateTime createdDate});
}

/// @nodoc
class __$PriceCopyWithImpl<$Res> extends _$PriceCopyWithImpl<$Res>
    implements _$PriceCopyWith<$Res> {
  __$PriceCopyWithImpl(_Price _value, $Res Function(_Price) _then)
      : super(_value, (v) => _then(v as _Price));

  @override
  _Price get _value => super._value as _Price;

  @override
  $Res call({
    Object? id = freezed,
    Object? rate = freezed,
    Object? description = freezed,
    Object? isDefault = freezed,
    Object? isDeleted = freezed,
    Object? isPerDay = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_Price(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: isDefault == freezed
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: isDeleted == freezed
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isPerDay: isPerDay == freezed
          ? _value.isPerDay
          : isPerDay // ignore: cast_nullable_to_non_nullable
              as bool,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Price implements _Price {
  _$_Price(
      {required this.id,
      required this.rate,
      required this.description,
      @JsonKey(name: 'is_default', fromJson: _fromDBool, toJson: _toDBool)
          required this.isDefault,
      @JsonKey(name: 'is_deleted', fromJson: _fromDBool, toJson: _toDBool)
          required this.isDeleted,
      @JsonKey(name: 'is_per_day', fromJson: _fromDBool, toJson: _toDBool)
          required this.isPerDay,
      @JsonKey(name: 'created_date', fromJson: _fromDBDate, toJson: _toDBDate)
          required this.createdDate});

  factory _$_Price.fromJson(Map<String, dynamic> json) =>
      _$$_PriceFromJson(json);

  @override
  final int id;
  @override
  final double rate;
  @override
  final String description;
  @override
  @JsonKey(name: 'is_default', fromJson: _fromDBool, toJson: _toDBool)
  final bool isDefault;
  @override
  @JsonKey(name: 'is_deleted', fromJson: _fromDBool, toJson: _toDBool)
  final bool isDeleted;
  @override
  @JsonKey(name: 'is_per_day', fromJson: _fromDBool, toJson: _toDBool)
  final bool isPerDay;
  @override
  @JsonKey(name: 'created_date', fromJson: _fromDBDate, toJson: _toDBDate)
  final DateTime createdDate;

  @override
  String toString() {
    return 'Price(id: $id, rate: $rate, description: $description, isDefault: $isDefault, isDeleted: $isDeleted, isPerDay: $isPerDay, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Price &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.rate, rate) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.isDefault, isDefault) &&
            const DeepCollectionEquality().equals(other.isDeleted, isDeleted) &&
            const DeepCollectionEquality().equals(other.isPerDay, isPerDay) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(rate),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(isDefault),
      const DeepCollectionEquality().hash(isDeleted),
      const DeepCollectionEquality().hash(isPerDay),
      const DeepCollectionEquality().hash(createdDate));

  @JsonKey(ignore: true)
  @override
  _$PriceCopyWith<_Price> get copyWith =>
      __$PriceCopyWithImpl<_Price>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceToJson(this);
  }
}

abstract class _Price implements Price {
  factory _Price(
      {required int id,
      required double rate,
      required String description,
      @JsonKey(name: 'is_default', fromJson: _fromDBool, toJson: _toDBool)
          required bool isDefault,
      @JsonKey(name: 'is_deleted', fromJson: _fromDBool, toJson: _toDBool)
          required bool isDeleted,
      @JsonKey(name: 'is_per_day', fromJson: _fromDBool, toJson: _toDBool)
          required bool isPerDay,
      @JsonKey(name: 'created_date', fromJson: _fromDBDate, toJson: _toDBDate)
          required DateTime createdDate}) = _$_Price;

  factory _Price.fromJson(Map<String, dynamic> json) = _$_Price.fromJson;

  @override
  int get id;
  @override
  double get rate;
  @override
  String get description;
  @override
  @JsonKey(name: 'is_default', fromJson: _fromDBool, toJson: _toDBool)
  bool get isDefault;
  @override
  @JsonKey(name: 'is_deleted', fromJson: _fromDBool, toJson: _toDBool)
  bool get isDeleted;
  @override
  @JsonKey(name: 'is_per_day', fromJson: _fromDBool, toJson: _toDBool)
  bool get isPerDay;
  @override
  @JsonKey(name: 'created_date', fromJson: _fromDBDate, toJson: _toDBDate)
  DateTime get createdDate;
  @override
  @JsonKey(ignore: true)
  _$PriceCopyWith<_Price> get copyWith => throw _privateConstructorUsedError;
}
