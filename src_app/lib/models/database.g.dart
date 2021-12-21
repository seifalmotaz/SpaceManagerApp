// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Guest extends DataClass implements Insertable<Guest> {
  final int id;
  final String phone;
  final String? name;
  final String? email;
  final String career;
  final String? gender;
  final String? nationalId;
  final String? nationalIdPic;
  final String? password;
  final bool isAdmin;
  final bool isStaff;
  final DateTime createdDate;
  Guest(
      {required this.id,
      required this.phone,
      this.name,
      this.email,
      required this.career,
      this.gender,
      this.nationalId,
      this.nationalIdPic,
      this.password,
      required this.isAdmin,
      required this.isStaff,
      required this.createdDate});
  factory Guest.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Guest(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      phone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email']),
      career: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}career'])!,
      gender: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gender']),
      nationalId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}national_id']),
      nationalIdPic: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}national_id_pic']),
      password: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}password']),
      isAdmin: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_admin'])!,
      isStaff: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_staff'])!,
      createdDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['phone'] = Variable<String>(phone);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String?>(email);
    }
    map['career'] = Variable<String>(career);
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String?>(gender);
    }
    if (!nullToAbsent || nationalId != null) {
      map['national_id'] = Variable<String?>(nationalId);
    }
    if (!nullToAbsent || nationalIdPic != null) {
      map['national_id_pic'] = Variable<String?>(nationalIdPic);
    }
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String?>(password);
    }
    map['is_admin'] = Variable<bool>(isAdmin);
    map['is_staff'] = Variable<bool>(isStaff);
    map['created_date'] = Variable<DateTime>(createdDate);
    return map;
  }

  GuestsCompanion toCompanion(bool nullToAbsent) {
    return GuestsCompanion(
      id: Value(id),
      phone: Value(phone),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      career: Value(career),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      nationalId: nationalId == null && nullToAbsent
          ? const Value.absent()
          : Value(nationalId),
      nationalIdPic: nationalIdPic == null && nullToAbsent
          ? const Value.absent()
          : Value(nationalIdPic),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
      isAdmin: Value(isAdmin),
      isStaff: Value(isStaff),
      createdDate: Value(createdDate),
    );
  }

  factory Guest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Guest(
      id: serializer.fromJson<int>(json['id']),
      phone: serializer.fromJson<String>(json['phone']),
      name: serializer.fromJson<String?>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
      career: serializer.fromJson<String>(json['career']),
      gender: serializer.fromJson<String?>(json['gender']),
      nationalId: serializer.fromJson<String?>(json['nationalId']),
      nationalIdPic: serializer.fromJson<String?>(json['nationalIdPic']),
      password: serializer.fromJson<String?>(json['password']),
      isAdmin: serializer.fromJson<bool>(json['isAdmin']),
      isStaff: serializer.fromJson<bool>(json['isStaff']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'phone': serializer.toJson<String>(phone),
      'name': serializer.toJson<String?>(name),
      'email': serializer.toJson<String?>(email),
      'career': serializer.toJson<String>(career),
      'gender': serializer.toJson<String?>(gender),
      'nationalId': serializer.toJson<String?>(nationalId),
      'nationalIdPic': serializer.toJson<String?>(nationalIdPic),
      'password': serializer.toJson<String?>(password),
      'isAdmin': serializer.toJson<bool>(isAdmin),
      'isStaff': serializer.toJson<bool>(isStaff),
      'createdDate': serializer.toJson<DateTime>(createdDate),
    };
  }

  Guest copyWith(
          {int? id,
          String? phone,
          String? name,
          String? email,
          String? career,
          String? gender,
          String? nationalId,
          String? nationalIdPic,
          String? password,
          bool? isAdmin,
          bool? isStaff,
          DateTime? createdDate}) =>
      Guest(
        id: id ?? this.id,
        phone: phone ?? this.phone,
        name: name ?? this.name,
        email: email ?? this.email,
        career: career ?? this.career,
        gender: gender ?? this.gender,
        nationalId: nationalId ?? this.nationalId,
        nationalIdPic: nationalIdPic ?? this.nationalIdPic,
        password: password ?? this.password,
        isAdmin: isAdmin ?? this.isAdmin,
        isStaff: isStaff ?? this.isStaff,
        createdDate: createdDate ?? this.createdDate,
      );
  @override
  String toString() {
    return (StringBuffer('Guest(')
          ..write('id: $id, ')
          ..write('phone: $phone, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('career: $career, ')
          ..write('gender: $gender, ')
          ..write('nationalId: $nationalId, ')
          ..write('nationalIdPic: $nationalIdPic, ')
          ..write('password: $password, ')
          ..write('isAdmin: $isAdmin, ')
          ..write('isStaff: $isStaff, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, phone, name, email, career, gender,
      nationalId, nationalIdPic, password, isAdmin, isStaff, createdDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Guest &&
          other.id == this.id &&
          other.phone == this.phone &&
          other.name == this.name &&
          other.email == this.email &&
          other.career == this.career &&
          other.gender == this.gender &&
          other.nationalId == this.nationalId &&
          other.nationalIdPic == this.nationalIdPic &&
          other.password == this.password &&
          other.isAdmin == this.isAdmin &&
          other.isStaff == this.isStaff &&
          other.createdDate == this.createdDate);
}

class GuestsCompanion extends UpdateCompanion<Guest> {
  final Value<int> id;
  final Value<String> phone;
  final Value<String?> name;
  final Value<String?> email;
  final Value<String> career;
  final Value<String?> gender;
  final Value<String?> nationalId;
  final Value<String?> nationalIdPic;
  final Value<String?> password;
  final Value<bool> isAdmin;
  final Value<bool> isStaff;
  final Value<DateTime> createdDate;
  const GuestsCompanion({
    this.id = const Value.absent(),
    this.phone = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.career = const Value.absent(),
    this.gender = const Value.absent(),
    this.nationalId = const Value.absent(),
    this.nationalIdPic = const Value.absent(),
    this.password = const Value.absent(),
    this.isAdmin = const Value.absent(),
    this.isStaff = const Value.absent(),
    this.createdDate = const Value.absent(),
  });
  GuestsCompanion.insert({
    this.id = const Value.absent(),
    required String phone,
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.career = const Value.absent(),
    this.gender = const Value.absent(),
    this.nationalId = const Value.absent(),
    this.nationalIdPic = const Value.absent(),
    this.password = const Value.absent(),
    this.isAdmin = const Value.absent(),
    this.isStaff = const Value.absent(),
    this.createdDate = const Value.absent(),
  }) : phone = Value(phone);
  static Insertable<Guest> custom({
    Expression<int>? id,
    Expression<String>? phone,
    Expression<String?>? name,
    Expression<String?>? email,
    Expression<String>? career,
    Expression<String?>? gender,
    Expression<String?>? nationalId,
    Expression<String?>? nationalIdPic,
    Expression<String?>? password,
    Expression<bool>? isAdmin,
    Expression<bool>? isStaff,
    Expression<DateTime>? createdDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (phone != null) 'phone': phone,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (career != null) 'career': career,
      if (gender != null) 'gender': gender,
      if (nationalId != null) 'national_id': nationalId,
      if (nationalIdPic != null) 'national_id_pic': nationalIdPic,
      if (password != null) 'password': password,
      if (isAdmin != null) 'is_admin': isAdmin,
      if (isStaff != null) 'is_staff': isStaff,
      if (createdDate != null) 'created_date': createdDate,
    });
  }

  GuestsCompanion copyWith(
      {Value<int>? id,
      Value<String>? phone,
      Value<String?>? name,
      Value<String?>? email,
      Value<String>? career,
      Value<String?>? gender,
      Value<String?>? nationalId,
      Value<String?>? nationalIdPic,
      Value<String?>? password,
      Value<bool>? isAdmin,
      Value<bool>? isStaff,
      Value<DateTime>? createdDate}) {
    return GuestsCompanion(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      email: email ?? this.email,
      career: career ?? this.career,
      gender: gender ?? this.gender,
      nationalId: nationalId ?? this.nationalId,
      nationalIdPic: nationalIdPic ?? this.nationalIdPic,
      password: password ?? this.password,
      isAdmin: isAdmin ?? this.isAdmin,
      isStaff: isStaff ?? this.isStaff,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    if (career.present) {
      map['career'] = Variable<String>(career.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String?>(gender.value);
    }
    if (nationalId.present) {
      map['national_id'] = Variable<String?>(nationalId.value);
    }
    if (nationalIdPic.present) {
      map['national_id_pic'] = Variable<String?>(nationalIdPic.value);
    }
    if (password.present) {
      map['password'] = Variable<String?>(password.value);
    }
    if (isAdmin.present) {
      map['is_admin'] = Variable<bool>(isAdmin.value);
    }
    if (isStaff.present) {
      map['is_staff'] = Variable<bool>(isStaff.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GuestsCompanion(')
          ..write('id: $id, ')
          ..write('phone: $phone, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('career: $career, ')
          ..write('gender: $gender, ')
          ..write('nationalId: $nationalId, ')
          ..write('nationalIdPic: $nationalIdPic, ')
          ..write('password: $password, ')
          ..write('isAdmin: $isAdmin, ')
          ..write('isStaff: $isStaff, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }
}

class $GuestsTable extends Guests with TableInfo<$GuestsTable, Guest> {
  final GeneratedDatabase _db;
  final String? _alias;
  $GuestsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String?> phone = GeneratedColumn<String?>(
      'phone', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 17),
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 51),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _careerMeta = const VerificationMeta('career');
  @override
  late final GeneratedColumn<String?> career = GeneratedColumn<String?>(
      'career', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 13),
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant('GUEST'));
  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String?> gender = GeneratedColumn<String?>(
      'gender', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 13),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _nationalIdMeta = const VerificationMeta('nationalId');
  @override
  late final GeneratedColumn<String?> nationalId = GeneratedColumn<String?>(
      'national_id', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _nationalIdPicMeta =
      const VerificationMeta('nationalIdPic');
  @override
  late final GeneratedColumn<String?> nationalIdPic = GeneratedColumn<String?>(
      'national_id_pic', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  @override
  late final GeneratedColumn<String?> password = GeneratedColumn<String?>(
      'password', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _isAdminMeta = const VerificationMeta('isAdmin');
  @override
  late final GeneratedColumn<bool?> isAdmin = GeneratedColumn<bool?>(
      'is_admin', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_admin IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _isStaffMeta = const VerificationMeta('isStaff');
  @override
  late final GeneratedColumn<bool?> isStaff = GeneratedColumn<bool?>(
      'is_staff', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_staff IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime?> createdDate =
      GeneratedColumn<DateTime?>('created_date', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        phone,
        name,
        email,
        career,
        gender,
        nationalId,
        nationalIdPic,
        password,
        isAdmin,
        isStaff,
        createdDate
      ];
  @override
  String get aliasedName => _alias ?? 'guests';
  @override
  String get actualTableName => 'guests';
  @override
  VerificationContext validateIntegrity(Insertable<Guest> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('career')) {
      context.handle(_careerMeta,
          career.isAcceptableOrUnknown(data['career']!, _careerMeta));
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    }
    if (data.containsKey('national_id')) {
      context.handle(
          _nationalIdMeta,
          nationalId.isAcceptableOrUnknown(
              data['national_id']!, _nationalIdMeta));
    }
    if (data.containsKey('national_id_pic')) {
      context.handle(
          _nationalIdPicMeta,
          nationalIdPic.isAcceptableOrUnknown(
              data['national_id_pic']!, _nationalIdPicMeta));
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    }
    if (data.containsKey('is_admin')) {
      context.handle(_isAdminMeta,
          isAdmin.isAcceptableOrUnknown(data['is_admin']!, _isAdminMeta));
    }
    if (data.containsKey('is_staff')) {
      context.handle(_isStaffMeta,
          isStaff.isAcceptableOrUnknown(data['is_staff']!, _isStaffMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Guest map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Guest.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GuestsTable createAlias(String alias) {
    return $GuestsTable(_db, alias);
  }
}

class Price extends DataClass implements Insertable<Price> {
  final int id;
  final double ratePerGuest;
  final String? description;
  final bool isDefault;
  Price(
      {required this.id,
      required this.ratePerGuest,
      this.description,
      required this.isDefault});
  factory Price.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Price(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      ratePerGuest: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rate_per_guest'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      isDefault: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_default'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['rate_per_guest'] = Variable<double>(ratePerGuest);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    map['is_default'] = Variable<bool>(isDefault);
    return map;
  }

  PricesCompanion toCompanion(bool nullToAbsent) {
    return PricesCompanion(
      id: Value(id),
      ratePerGuest: Value(ratePerGuest),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isDefault: Value(isDefault),
    );
  }

  factory Price.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Price(
      id: serializer.fromJson<int>(json['id']),
      ratePerGuest: serializer.fromJson<double>(json['ratePerGuest']),
      description: serializer.fromJson<String?>(json['description']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ratePerGuest': serializer.toJson<double>(ratePerGuest),
      'description': serializer.toJson<String?>(description),
      'isDefault': serializer.toJson<bool>(isDefault),
    };
  }

  Price copyWith(
          {int? id,
          double? ratePerGuest,
          String? description,
          bool? isDefault}) =>
      Price(
        id: id ?? this.id,
        ratePerGuest: ratePerGuest ?? this.ratePerGuest,
        description: description ?? this.description,
        isDefault: isDefault ?? this.isDefault,
      );
  @override
  String toString() {
    return (StringBuffer('Price(')
          ..write('id: $id, ')
          ..write('ratePerGuest: $ratePerGuest, ')
          ..write('description: $description, ')
          ..write('isDefault: $isDefault')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ratePerGuest, description, isDefault);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Price &&
          other.id == this.id &&
          other.ratePerGuest == this.ratePerGuest &&
          other.description == this.description &&
          other.isDefault == this.isDefault);
}

class PricesCompanion extends UpdateCompanion<Price> {
  final Value<int> id;
  final Value<double> ratePerGuest;
  final Value<String?> description;
  final Value<bool> isDefault;
  const PricesCompanion({
    this.id = const Value.absent(),
    this.ratePerGuest = const Value.absent(),
    this.description = const Value.absent(),
    this.isDefault = const Value.absent(),
  });
  PricesCompanion.insert({
    this.id = const Value.absent(),
    required double ratePerGuest,
    this.description = const Value.absent(),
    required bool isDefault,
  })  : ratePerGuest = Value(ratePerGuest),
        isDefault = Value(isDefault);
  static Insertable<Price> custom({
    Expression<int>? id,
    Expression<double>? ratePerGuest,
    Expression<String?>? description,
    Expression<bool>? isDefault,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ratePerGuest != null) 'rate_per_guest': ratePerGuest,
      if (description != null) 'description': description,
      if (isDefault != null) 'is_default': isDefault,
    });
  }

  PricesCompanion copyWith(
      {Value<int>? id,
      Value<double>? ratePerGuest,
      Value<String?>? description,
      Value<bool>? isDefault}) {
    return PricesCompanion(
      id: id ?? this.id,
      ratePerGuest: ratePerGuest ?? this.ratePerGuest,
      description: description ?? this.description,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ratePerGuest.present) {
      map['rate_per_guest'] = Variable<double>(ratePerGuest.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PricesCompanion(')
          ..write('id: $id, ')
          ..write('ratePerGuest: $ratePerGuest, ')
          ..write('description: $description, ')
          ..write('isDefault: $isDefault')
          ..write(')'))
        .toString();
  }
}

class $PricesTable extends Prices with TableInfo<$PricesTable, Price> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PricesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _ratePerGuestMeta =
      const VerificationMeta('ratePerGuest');
  @override
  late final GeneratedColumn<double?> ratePerGuest = GeneratedColumn<double?>(
      'rate_per_guest', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant('Workspace price rate'));
  final VerificationMeta _isDefaultMeta = const VerificationMeta('isDefault');
  @override
  late final GeneratedColumn<bool?> isDefault = GeneratedColumn<bool?>(
      'is_default', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_default IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns =>
      [id, ratePerGuest, description, isDefault];
  @override
  String get aliasedName => _alias ?? 'prices';
  @override
  String get actualTableName => 'prices';
  @override
  VerificationContext validateIntegrity(Insertable<Price> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('rate_per_guest')) {
      context.handle(
          _ratePerGuestMeta,
          ratePerGuest.isAcceptableOrUnknown(
              data['rate_per_guest']!, _ratePerGuestMeta));
    } else if (isInserting) {
      context.missing(_ratePerGuestMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('is_default')) {
      context.handle(_isDefaultMeta,
          isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta));
    } else if (isInserting) {
      context.missing(_isDefaultMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Price map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Price.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PricesTable createAlias(String alias) {
    return $PricesTable(_db, alias);
  }
}

class Course extends DataClass implements Insertable<Course> {
  final int id;
  final String name;
  final double ratePerGuest;
  final DateTime createdDate;
  Course(
      {required this.id,
      required this.name,
      required this.ratePerGuest,
      required this.createdDate});
  factory Course.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Course(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      ratePerGuest: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rate_per_guest'])!,
      createdDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['rate_per_guest'] = Variable<double>(ratePerGuest);
    map['created_date'] = Variable<DateTime>(createdDate);
    return map;
  }

  CoursesCompanion toCompanion(bool nullToAbsent) {
    return CoursesCompanion(
      id: Value(id),
      name: Value(name),
      ratePerGuest: Value(ratePerGuest),
      createdDate: Value(createdDate),
    );
  }

  factory Course.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Course(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      ratePerGuest: serializer.fromJson<double>(json['ratePerGuest']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'ratePerGuest': serializer.toJson<double>(ratePerGuest),
      'createdDate': serializer.toJson<DateTime>(createdDate),
    };
  }

  Course copyWith(
          {int? id,
          String? name,
          double? ratePerGuest,
          DateTime? createdDate}) =>
      Course(
        id: id ?? this.id,
        name: name ?? this.name,
        ratePerGuest: ratePerGuest ?? this.ratePerGuest,
        createdDate: createdDate ?? this.createdDate,
      );
  @override
  String toString() {
    return (StringBuffer('Course(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ratePerGuest: $ratePerGuest, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, ratePerGuest, createdDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Course &&
          other.id == this.id &&
          other.name == this.name &&
          other.ratePerGuest == this.ratePerGuest &&
          other.createdDate == this.createdDate);
}

class CoursesCompanion extends UpdateCompanion<Course> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> ratePerGuest;
  final Value<DateTime> createdDate;
  const CoursesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.ratePerGuest = const Value.absent(),
    this.createdDate = const Value.absent(),
  });
  CoursesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double ratePerGuest,
    this.createdDate = const Value.absent(),
  })  : name = Value(name),
        ratePerGuest = Value(ratePerGuest);
  static Insertable<Course> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? ratePerGuest,
    Expression<DateTime>? createdDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (ratePerGuest != null) 'rate_per_guest': ratePerGuest,
      if (createdDate != null) 'created_date': createdDate,
    });
  }

  CoursesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? ratePerGuest,
      Value<DateTime>? createdDate}) {
    return CoursesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      ratePerGuest: ratePerGuest ?? this.ratePerGuest,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (ratePerGuest.present) {
      map['rate_per_guest'] = Variable<double>(ratePerGuest.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoursesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ratePerGuest: $ratePerGuest, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }
}

class $CoursesTable extends Courses with TableInfo<$CoursesTable, Course> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CoursesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _ratePerGuestMeta =
      const VerificationMeta('ratePerGuest');
  @override
  late final GeneratedColumn<double?> ratePerGuest = GeneratedColumn<double?>(
      'rate_per_guest', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime?> createdDate =
      GeneratedColumn<DateTime?>('created_date', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns => [id, name, ratePerGuest, createdDate];
  @override
  String get aliasedName => _alias ?? 'courses';
  @override
  String get actualTableName => 'courses';
  @override
  VerificationContext validateIntegrity(Insertable<Course> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('rate_per_guest')) {
      context.handle(
          _ratePerGuestMeta,
          ratePerGuest.isAcceptableOrUnknown(
              data['rate_per_guest']!, _ratePerGuestMeta));
    } else if (isInserting) {
      context.missing(_ratePerGuestMeta);
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Course map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Course.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CoursesTable createAlias(String alias) {
    return $CoursesTable(_db, alias);
  }
}

class Room extends DataClass implements Insertable<Room> {
  final int id;
  final String name;
  final int capacity;
  final double ratePerHour;
  Room(
      {required this.id,
      required this.name,
      required this.capacity,
      required this.ratePerHour});
  factory Room.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Room(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      capacity: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}capacity'])!,
      ratePerHour: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rate_per_hour'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['capacity'] = Variable<int>(capacity);
    map['rate_per_hour'] = Variable<double>(ratePerHour);
    return map;
  }

  RoomsCompanion toCompanion(bool nullToAbsent) {
    return RoomsCompanion(
      id: Value(id),
      name: Value(name),
      capacity: Value(capacity),
      ratePerHour: Value(ratePerHour),
    );
  }

  factory Room.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Room(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      capacity: serializer.fromJson<int>(json['capacity']),
      ratePerHour: serializer.fromJson<double>(json['ratePerHour']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'capacity': serializer.toJson<int>(capacity),
      'ratePerHour': serializer.toJson<double>(ratePerHour),
    };
  }

  Room copyWith({int? id, String? name, int? capacity, double? ratePerHour}) =>
      Room(
        id: id ?? this.id,
        name: name ?? this.name,
        capacity: capacity ?? this.capacity,
        ratePerHour: ratePerHour ?? this.ratePerHour,
      );
  @override
  String toString() {
    return (StringBuffer('Room(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('capacity: $capacity, ')
          ..write('ratePerHour: $ratePerHour')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, capacity, ratePerHour);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Room &&
          other.id == this.id &&
          other.name == this.name &&
          other.capacity == this.capacity &&
          other.ratePerHour == this.ratePerHour);
}

class RoomsCompanion extends UpdateCompanion<Room> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> capacity;
  final Value<double> ratePerHour;
  const RoomsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.capacity = const Value.absent(),
    this.ratePerHour = const Value.absent(),
  });
  RoomsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int capacity,
    required double ratePerHour,
  })  : name = Value(name),
        capacity = Value(capacity),
        ratePerHour = Value(ratePerHour);
  static Insertable<Room> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? capacity,
    Expression<double>? ratePerHour,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (capacity != null) 'capacity': capacity,
      if (ratePerHour != null) 'rate_per_hour': ratePerHour,
    });
  }

  RoomsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? capacity,
      Value<double>? ratePerHour}) {
    return RoomsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      capacity: capacity ?? this.capacity,
      ratePerHour: ratePerHour ?? this.ratePerHour,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (capacity.present) {
      map['capacity'] = Variable<int>(capacity.value);
    }
    if (ratePerHour.present) {
      map['rate_per_hour'] = Variable<double>(ratePerHour.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('capacity: $capacity, ')
          ..write('ratePerHour: $ratePerHour')
          ..write(')'))
        .toString();
  }
}

class $RoomsTable extends Rooms with TableInfo<$RoomsTable, Room> {
  final GeneratedDatabase _db;
  final String? _alias;
  $RoomsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _capacityMeta = const VerificationMeta('capacity');
  @override
  late final GeneratedColumn<int?> capacity = GeneratedColumn<int?>(
      'capacity', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _ratePerHourMeta =
      const VerificationMeta('ratePerHour');
  @override
  late final GeneratedColumn<double?> ratePerHour = GeneratedColumn<double?>(
      'rate_per_hour', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, capacity, ratePerHour];
  @override
  String get aliasedName => _alias ?? 'rooms';
  @override
  String get actualTableName => 'rooms';
  @override
  VerificationContext validateIntegrity(Insertable<Room> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('capacity')) {
      context.handle(_capacityMeta,
          capacity.isAcceptableOrUnknown(data['capacity']!, _capacityMeta));
    } else if (isInserting) {
      context.missing(_capacityMeta);
    }
    if (data.containsKey('rate_per_hour')) {
      context.handle(
          _ratePerHourMeta,
          ratePerHour.isAcceptableOrUnknown(
              data['rate_per_hour']!, _ratePerHourMeta));
    } else if (isInserting) {
      context.missing(_ratePerHourMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Room map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Room.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RoomsTable createAlias(String alias) {
    return $RoomsTable(_db, alias);
  }
}

class Reservation extends DataClass implements Insertable<Reservation> {
  final int id;
  final DateTime from;
  final DateTime to;
  final int roomId;
  final int guestId;
  final bool isPrePaId;
  Reservation(
      {required this.id,
      required this.from,
      required this.to,
      required this.roomId,
      required this.guestId,
      required this.isPrePaId});
  factory Reservation.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Reservation(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      from: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}from'])!,
      to: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}to'])!,
      roomId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}room_id'])!,
      guestId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}guest_id'])!,
      isPrePaId: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_pre_pa_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['from'] = Variable<DateTime>(from);
    map['to'] = Variable<DateTime>(to);
    map['room_id'] = Variable<int>(roomId);
    map['guest_id'] = Variable<int>(guestId);
    map['is_pre_pa_id'] = Variable<bool>(isPrePaId);
    return map;
  }

  ReservationsCompanion toCompanion(bool nullToAbsent) {
    return ReservationsCompanion(
      id: Value(id),
      from: Value(from),
      to: Value(to),
      roomId: Value(roomId),
      guestId: Value(guestId),
      isPrePaId: Value(isPrePaId),
    );
  }

  factory Reservation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reservation(
      id: serializer.fromJson<int>(json['id']),
      from: serializer.fromJson<DateTime>(json['from']),
      to: serializer.fromJson<DateTime>(json['to']),
      roomId: serializer.fromJson<int>(json['roomId']),
      guestId: serializer.fromJson<int>(json['guestId']),
      isPrePaId: serializer.fromJson<bool>(json['isPrePaId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'from': serializer.toJson<DateTime>(from),
      'to': serializer.toJson<DateTime>(to),
      'roomId': serializer.toJson<int>(roomId),
      'guestId': serializer.toJson<int>(guestId),
      'isPrePaId': serializer.toJson<bool>(isPrePaId),
    };
  }

  Reservation copyWith(
          {int? id,
          DateTime? from,
          DateTime? to,
          int? roomId,
          int? guestId,
          bool? isPrePaId}) =>
      Reservation(
        id: id ?? this.id,
        from: from ?? this.from,
        to: to ?? this.to,
        roomId: roomId ?? this.roomId,
        guestId: guestId ?? this.guestId,
        isPrePaId: isPrePaId ?? this.isPrePaId,
      );
  @override
  String toString() {
    return (StringBuffer('Reservation(')
          ..write('id: $id, ')
          ..write('from: $from, ')
          ..write('to: $to, ')
          ..write('roomId: $roomId, ')
          ..write('guestId: $guestId, ')
          ..write('isPrePaId: $isPrePaId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, from, to, roomId, guestId, isPrePaId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reservation &&
          other.id == this.id &&
          other.from == this.from &&
          other.to == this.to &&
          other.roomId == this.roomId &&
          other.guestId == this.guestId &&
          other.isPrePaId == this.isPrePaId);
}

class ReservationsCompanion extends UpdateCompanion<Reservation> {
  final Value<int> id;
  final Value<DateTime> from;
  final Value<DateTime> to;
  final Value<int> roomId;
  final Value<int> guestId;
  final Value<bool> isPrePaId;
  const ReservationsCompanion({
    this.id = const Value.absent(),
    this.from = const Value.absent(),
    this.to = const Value.absent(),
    this.roomId = const Value.absent(),
    this.guestId = const Value.absent(),
    this.isPrePaId = const Value.absent(),
  });
  ReservationsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime from,
    required DateTime to,
    required int roomId,
    required int guestId,
    required bool isPrePaId,
  })  : from = Value(from),
        to = Value(to),
        roomId = Value(roomId),
        guestId = Value(guestId),
        isPrePaId = Value(isPrePaId);
  static Insertable<Reservation> custom({
    Expression<int>? id,
    Expression<DateTime>? from,
    Expression<DateTime>? to,
    Expression<int>? roomId,
    Expression<int>? guestId,
    Expression<bool>? isPrePaId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (from != null) 'from': from,
      if (to != null) 'to': to,
      if (roomId != null) 'room_id': roomId,
      if (guestId != null) 'guest_id': guestId,
      if (isPrePaId != null) 'is_pre_pa_id': isPrePaId,
    });
  }

  ReservationsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? from,
      Value<DateTime>? to,
      Value<int>? roomId,
      Value<int>? guestId,
      Value<bool>? isPrePaId}) {
    return ReservationsCompanion(
      id: id ?? this.id,
      from: from ?? this.from,
      to: to ?? this.to,
      roomId: roomId ?? this.roomId,
      guestId: guestId ?? this.guestId,
      isPrePaId: isPrePaId ?? this.isPrePaId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (from.present) {
      map['from'] = Variable<DateTime>(from.value);
    }
    if (to.present) {
      map['to'] = Variable<DateTime>(to.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<int>(roomId.value);
    }
    if (guestId.present) {
      map['guest_id'] = Variable<int>(guestId.value);
    }
    if (isPrePaId.present) {
      map['is_pre_pa_id'] = Variable<bool>(isPrePaId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReservationsCompanion(')
          ..write('id: $id, ')
          ..write('from: $from, ')
          ..write('to: $to, ')
          ..write('roomId: $roomId, ')
          ..write('guestId: $guestId, ')
          ..write('isPrePaId: $isPrePaId')
          ..write(')'))
        .toString();
  }
}

class $ReservationsTable extends Reservations
    with TableInfo<$ReservationsTable, Reservation> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ReservationsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _fromMeta = const VerificationMeta('from');
  @override
  late final GeneratedColumn<DateTime?> from = GeneratedColumn<DateTime?>(
      'from', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _toMeta = const VerificationMeta('to');
  @override
  late final GeneratedColumn<DateTime?> to = GeneratedColumn<DateTime?>(
      'to', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<int?> roomId = GeneratedColumn<int?>(
      'room_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _guestIdMeta = const VerificationMeta('guestId');
  @override
  late final GeneratedColumn<int?> guestId = GeneratedColumn<int?>(
      'guest_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _isPrePaIdMeta = const VerificationMeta('isPrePaId');
  @override
  late final GeneratedColumn<bool?> isPrePaId = GeneratedColumn<bool?>(
      'is_pre_pa_id', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_pre_pa_id IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns =>
      [id, from, to, roomId, guestId, isPrePaId];
  @override
  String get aliasedName => _alias ?? 'reservations';
  @override
  String get actualTableName => 'reservations';
  @override
  VerificationContext validateIntegrity(Insertable<Reservation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('from')) {
      context.handle(
          _fromMeta, from.isAcceptableOrUnknown(data['from']!, _fromMeta));
    } else if (isInserting) {
      context.missing(_fromMeta);
    }
    if (data.containsKey('to')) {
      context.handle(_toMeta, to.isAcceptableOrUnknown(data['to']!, _toMeta));
    } else if (isInserting) {
      context.missing(_toMeta);
    }
    if (data.containsKey('room_id')) {
      context.handle(_roomIdMeta,
          roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta));
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('guest_id')) {
      context.handle(_guestIdMeta,
          guestId.isAcceptableOrUnknown(data['guest_id']!, _guestIdMeta));
    } else if (isInserting) {
      context.missing(_guestIdMeta);
    }
    if (data.containsKey('is_pre_pa_id')) {
      context.handle(
          _isPrePaIdMeta,
          isPrePaId.isAcceptableOrUnknown(
              data['is_pre_pa_id']!, _isPrePaIdMeta));
    } else if (isInserting) {
      context.missing(_isPrePaIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reservation map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Reservation.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ReservationsTable createAlias(String alias) {
    return $ReservationsTable(_db, alias);
  }
}

class Session extends DataClass implements Insertable<Session> {
  final int id;
  final DateTime from;
  final DateTime to;
  final int guestsCount;
  final int guestId;
  final int? priceId;
  final int? courseId;
  final int? roomId;
  final int? reservationId;
  Session(
      {required this.id,
      required this.from,
      required this.to,
      required this.guestsCount,
      required this.guestId,
      this.priceId,
      this.courseId,
      this.roomId,
      this.reservationId});
  factory Session.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Session(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      from: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}from'])!,
      to: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}to'])!,
      guestsCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}guests_count'])!,
      guestId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}guest_id'])!,
      priceId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price_id']),
      courseId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}course_id']),
      roomId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}room_id']),
      reservationId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reservation_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['from'] = Variable<DateTime>(from);
    map['to'] = Variable<DateTime>(to);
    map['guests_count'] = Variable<int>(guestsCount);
    map['guest_id'] = Variable<int>(guestId);
    if (!nullToAbsent || priceId != null) {
      map['price_id'] = Variable<int?>(priceId);
    }
    if (!nullToAbsent || courseId != null) {
      map['course_id'] = Variable<int?>(courseId);
    }
    if (!nullToAbsent || roomId != null) {
      map['room_id'] = Variable<int?>(roomId);
    }
    if (!nullToAbsent || reservationId != null) {
      map['reservation_id'] = Variable<int?>(reservationId);
    }
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      id: Value(id),
      from: Value(from),
      to: Value(to),
      guestsCount: Value(guestsCount),
      guestId: Value(guestId),
      priceId: priceId == null && nullToAbsent
          ? const Value.absent()
          : Value(priceId),
      courseId: courseId == null && nullToAbsent
          ? const Value.absent()
          : Value(courseId),
      roomId:
          roomId == null && nullToAbsent ? const Value.absent() : Value(roomId),
      reservationId: reservationId == null && nullToAbsent
          ? const Value.absent()
          : Value(reservationId),
    );
  }

  factory Session.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Session(
      id: serializer.fromJson<int>(json['id']),
      from: serializer.fromJson<DateTime>(json['from']),
      to: serializer.fromJson<DateTime>(json['to']),
      guestsCount: serializer.fromJson<int>(json['guestsCount']),
      guestId: serializer.fromJson<int>(json['guestId']),
      priceId: serializer.fromJson<int?>(json['priceId']),
      courseId: serializer.fromJson<int?>(json['courseId']),
      roomId: serializer.fromJson<int?>(json['roomId']),
      reservationId: serializer.fromJson<int?>(json['reservationId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'from': serializer.toJson<DateTime>(from),
      'to': serializer.toJson<DateTime>(to),
      'guestsCount': serializer.toJson<int>(guestsCount),
      'guestId': serializer.toJson<int>(guestId),
      'priceId': serializer.toJson<int?>(priceId),
      'courseId': serializer.toJson<int?>(courseId),
      'roomId': serializer.toJson<int?>(roomId),
      'reservationId': serializer.toJson<int?>(reservationId),
    };
  }

  Session copyWith(
          {int? id,
          DateTime? from,
          DateTime? to,
          int? guestsCount,
          int? guestId,
          int? priceId,
          int? courseId,
          int? roomId,
          int? reservationId}) =>
      Session(
        id: id ?? this.id,
        from: from ?? this.from,
        to: to ?? this.to,
        guestsCount: guestsCount ?? this.guestsCount,
        guestId: guestId ?? this.guestId,
        priceId: priceId ?? this.priceId,
        courseId: courseId ?? this.courseId,
        roomId: roomId ?? this.roomId,
        reservationId: reservationId ?? this.reservationId,
      );
  @override
  String toString() {
    return (StringBuffer('Session(')
          ..write('id: $id, ')
          ..write('from: $from, ')
          ..write('to: $to, ')
          ..write('guestsCount: $guestsCount, ')
          ..write('guestId: $guestId, ')
          ..write('priceId: $priceId, ')
          ..write('courseId: $courseId, ')
          ..write('roomId: $roomId, ')
          ..write('reservationId: $reservationId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, from, to, guestsCount, guestId, priceId,
      courseId, roomId, reservationId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Session &&
          other.id == this.id &&
          other.from == this.from &&
          other.to == this.to &&
          other.guestsCount == this.guestsCount &&
          other.guestId == this.guestId &&
          other.priceId == this.priceId &&
          other.courseId == this.courseId &&
          other.roomId == this.roomId &&
          other.reservationId == this.reservationId);
}

class SessionsCompanion extends UpdateCompanion<Session> {
  final Value<int> id;
  final Value<DateTime> from;
  final Value<DateTime> to;
  final Value<int> guestsCount;
  final Value<int> guestId;
  final Value<int?> priceId;
  final Value<int?> courseId;
  final Value<int?> roomId;
  final Value<int?> reservationId;
  const SessionsCompanion({
    this.id = const Value.absent(),
    this.from = const Value.absent(),
    this.to = const Value.absent(),
    this.guestsCount = const Value.absent(),
    this.guestId = const Value.absent(),
    this.priceId = const Value.absent(),
    this.courseId = const Value.absent(),
    this.roomId = const Value.absent(),
    this.reservationId = const Value.absent(),
  });
  SessionsCompanion.insert({
    this.id = const Value.absent(),
    this.from = const Value.absent(),
    required DateTime to,
    required int guestsCount,
    required int guestId,
    this.priceId = const Value.absent(),
    this.courseId = const Value.absent(),
    this.roomId = const Value.absent(),
    this.reservationId = const Value.absent(),
  })  : to = Value(to),
        guestsCount = Value(guestsCount),
        guestId = Value(guestId);
  static Insertable<Session> custom({
    Expression<int>? id,
    Expression<DateTime>? from,
    Expression<DateTime>? to,
    Expression<int>? guestsCount,
    Expression<int>? guestId,
    Expression<int?>? priceId,
    Expression<int?>? courseId,
    Expression<int?>? roomId,
    Expression<int?>? reservationId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (from != null) 'from': from,
      if (to != null) 'to': to,
      if (guestsCount != null) 'guests_count': guestsCount,
      if (guestId != null) 'guest_id': guestId,
      if (priceId != null) 'price_id': priceId,
      if (courseId != null) 'course_id': courseId,
      if (roomId != null) 'room_id': roomId,
      if (reservationId != null) 'reservation_id': reservationId,
    });
  }

  SessionsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? from,
      Value<DateTime>? to,
      Value<int>? guestsCount,
      Value<int>? guestId,
      Value<int?>? priceId,
      Value<int?>? courseId,
      Value<int?>? roomId,
      Value<int?>? reservationId}) {
    return SessionsCompanion(
      id: id ?? this.id,
      from: from ?? this.from,
      to: to ?? this.to,
      guestsCount: guestsCount ?? this.guestsCount,
      guestId: guestId ?? this.guestId,
      priceId: priceId ?? this.priceId,
      courseId: courseId ?? this.courseId,
      roomId: roomId ?? this.roomId,
      reservationId: reservationId ?? this.reservationId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (from.present) {
      map['from'] = Variable<DateTime>(from.value);
    }
    if (to.present) {
      map['to'] = Variable<DateTime>(to.value);
    }
    if (guestsCount.present) {
      map['guests_count'] = Variable<int>(guestsCount.value);
    }
    if (guestId.present) {
      map['guest_id'] = Variable<int>(guestId.value);
    }
    if (priceId.present) {
      map['price_id'] = Variable<int?>(priceId.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<int?>(courseId.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<int?>(roomId.value);
    }
    if (reservationId.present) {
      map['reservation_id'] = Variable<int?>(reservationId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('id: $id, ')
          ..write('from: $from, ')
          ..write('to: $to, ')
          ..write('guestsCount: $guestsCount, ')
          ..write('guestId: $guestId, ')
          ..write('priceId: $priceId, ')
          ..write('courseId: $courseId, ')
          ..write('roomId: $roomId, ')
          ..write('reservationId: $reservationId')
          ..write(')'))
        .toString();
  }
}

class $SessionsTable extends Sessions with TableInfo<$SessionsTable, Session> {
  final GeneratedDatabase _db;
  final String? _alias;
  $SessionsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _fromMeta = const VerificationMeta('from');
  @override
  late final GeneratedColumn<DateTime?> from = GeneratedColumn<DateTime?>(
      'from', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  final VerificationMeta _toMeta = const VerificationMeta('to');
  @override
  late final GeneratedColumn<DateTime?> to = GeneratedColumn<DateTime?>(
      'to', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _guestsCountMeta =
      const VerificationMeta('guestsCount');
  @override
  late final GeneratedColumn<int?> guestsCount = GeneratedColumn<int?>(
      'guests_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _guestIdMeta = const VerificationMeta('guestId');
  @override
  late final GeneratedColumn<int?> guestId = GeneratedColumn<int?>(
      'guest_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _priceIdMeta = const VerificationMeta('priceId');
  @override
  late final GeneratedColumn<int?> priceId = GeneratedColumn<int?>(
      'price_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _courseIdMeta = const VerificationMeta('courseId');
  @override
  late final GeneratedColumn<int?> courseId = GeneratedColumn<int?>(
      'course_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<int?> roomId = GeneratedColumn<int?>(
      'room_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _reservationIdMeta =
      const VerificationMeta('reservationId');
  @override
  late final GeneratedColumn<int?> reservationId = GeneratedColumn<int?>(
      'reservation_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        from,
        to,
        guestsCount,
        guestId,
        priceId,
        courseId,
        roomId,
        reservationId
      ];
  @override
  String get aliasedName => _alias ?? 'sessions';
  @override
  String get actualTableName => 'sessions';
  @override
  VerificationContext validateIntegrity(Insertable<Session> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('from')) {
      context.handle(
          _fromMeta, from.isAcceptableOrUnknown(data['from']!, _fromMeta));
    }
    if (data.containsKey('to')) {
      context.handle(_toMeta, to.isAcceptableOrUnknown(data['to']!, _toMeta));
    } else if (isInserting) {
      context.missing(_toMeta);
    }
    if (data.containsKey('guests_count')) {
      context.handle(
          _guestsCountMeta,
          guestsCount.isAcceptableOrUnknown(
              data['guests_count']!, _guestsCountMeta));
    } else if (isInserting) {
      context.missing(_guestsCountMeta);
    }
    if (data.containsKey('guest_id')) {
      context.handle(_guestIdMeta,
          guestId.isAcceptableOrUnknown(data['guest_id']!, _guestIdMeta));
    } else if (isInserting) {
      context.missing(_guestIdMeta);
    }
    if (data.containsKey('price_id')) {
      context.handle(_priceIdMeta,
          priceId.isAcceptableOrUnknown(data['price_id']!, _priceIdMeta));
    }
    if (data.containsKey('course_id')) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta));
    }
    if (data.containsKey('room_id')) {
      context.handle(_roomIdMeta,
          roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta));
    }
    if (data.containsKey('reservation_id')) {
      context.handle(
          _reservationIdMeta,
          reservationId.isAcceptableOrUnknown(
              data['reservation_id']!, _reservationIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Session map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Session.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SessionsTable createAlias(String alias) {
    return $SessionsTable(_db, alias);
  }
}

class Bill extends DataClass implements Insertable<Bill> {
  final int id;
  final double total;
  final int staffId;
  final int? sessionId;
  final int? reservationId;
  Bill(
      {required this.id,
      required this.total,
      required this.staffId,
      this.sessionId,
      this.reservationId});
  factory Bill.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Bill(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      total: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total'])!,
      staffId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}staff_id'])!,
      sessionId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}session_id']),
      reservationId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reservation_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['total'] = Variable<double>(total);
    map['staff_id'] = Variable<int>(staffId);
    if (!nullToAbsent || sessionId != null) {
      map['session_id'] = Variable<int?>(sessionId);
    }
    if (!nullToAbsent || reservationId != null) {
      map['reservation_id'] = Variable<int?>(reservationId);
    }
    return map;
  }

  BillsCompanion toCompanion(bool nullToAbsent) {
    return BillsCompanion(
      id: Value(id),
      total: Value(total),
      staffId: Value(staffId),
      sessionId: sessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionId),
      reservationId: reservationId == null && nullToAbsent
          ? const Value.absent()
          : Value(reservationId),
    );
  }

  factory Bill.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Bill(
      id: serializer.fromJson<int>(json['id']),
      total: serializer.fromJson<double>(json['total']),
      staffId: serializer.fromJson<int>(json['staffId']),
      sessionId: serializer.fromJson<int?>(json['sessionId']),
      reservationId: serializer.fromJson<int?>(json['reservationId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'total': serializer.toJson<double>(total),
      'staffId': serializer.toJson<int>(staffId),
      'sessionId': serializer.toJson<int?>(sessionId),
      'reservationId': serializer.toJson<int?>(reservationId),
    };
  }

  Bill copyWith(
          {int? id,
          double? total,
          int? staffId,
          int? sessionId,
          int? reservationId}) =>
      Bill(
        id: id ?? this.id,
        total: total ?? this.total,
        staffId: staffId ?? this.staffId,
        sessionId: sessionId ?? this.sessionId,
        reservationId: reservationId ?? this.reservationId,
      );
  @override
  String toString() {
    return (StringBuffer('Bill(')
          ..write('id: $id, ')
          ..write('total: $total, ')
          ..write('staffId: $staffId, ')
          ..write('sessionId: $sessionId, ')
          ..write('reservationId: $reservationId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, total, staffId, sessionId, reservationId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Bill &&
          other.id == this.id &&
          other.total == this.total &&
          other.staffId == this.staffId &&
          other.sessionId == this.sessionId &&
          other.reservationId == this.reservationId);
}

class BillsCompanion extends UpdateCompanion<Bill> {
  final Value<int> id;
  final Value<double> total;
  final Value<int> staffId;
  final Value<int?> sessionId;
  final Value<int?> reservationId;
  const BillsCompanion({
    this.id = const Value.absent(),
    this.total = const Value.absent(),
    this.staffId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.reservationId = const Value.absent(),
  });
  BillsCompanion.insert({
    this.id = const Value.absent(),
    required double total,
    required int staffId,
    this.sessionId = const Value.absent(),
    this.reservationId = const Value.absent(),
  })  : total = Value(total),
        staffId = Value(staffId);
  static Insertable<Bill> custom({
    Expression<int>? id,
    Expression<double>? total,
    Expression<int>? staffId,
    Expression<int?>? sessionId,
    Expression<int?>? reservationId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (total != null) 'total': total,
      if (staffId != null) 'staff_id': staffId,
      if (sessionId != null) 'session_id': sessionId,
      if (reservationId != null) 'reservation_id': reservationId,
    });
  }

  BillsCompanion copyWith(
      {Value<int>? id,
      Value<double>? total,
      Value<int>? staffId,
      Value<int?>? sessionId,
      Value<int?>? reservationId}) {
    return BillsCompanion(
      id: id ?? this.id,
      total: total ?? this.total,
      staffId: staffId ?? this.staffId,
      sessionId: sessionId ?? this.sessionId,
      reservationId: reservationId ?? this.reservationId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (staffId.present) {
      map['staff_id'] = Variable<int>(staffId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int?>(sessionId.value);
    }
    if (reservationId.present) {
      map['reservation_id'] = Variable<int?>(reservationId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BillsCompanion(')
          ..write('id: $id, ')
          ..write('total: $total, ')
          ..write('staffId: $staffId, ')
          ..write('sessionId: $sessionId, ')
          ..write('reservationId: $reservationId')
          ..write(')'))
        .toString();
  }
}

class $BillsTable extends Bills with TableInfo<$BillsTable, Bill> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BillsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double?> total = GeneratedColumn<double?>(
      'total', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _staffIdMeta = const VerificationMeta('staffId');
  @override
  late final GeneratedColumn<int?> staffId = GeneratedColumn<int?>(
      'staff_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _sessionIdMeta = const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<int?> sessionId = GeneratedColumn<int?>(
      'session_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _reservationIdMeta =
      const VerificationMeta('reservationId');
  @override
  late final GeneratedColumn<int?> reservationId = GeneratedColumn<int?>(
      'reservation_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, total, staffId, sessionId, reservationId];
  @override
  String get aliasedName => _alias ?? 'bills';
  @override
  String get actualTableName => 'bills';
  @override
  VerificationContext validateIntegrity(Insertable<Bill> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('staff_id')) {
      context.handle(_staffIdMeta,
          staffId.isAcceptableOrUnknown(data['staff_id']!, _staffIdMeta));
    } else if (isInserting) {
      context.missing(_staffIdMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    }
    if (data.containsKey('reservation_id')) {
      context.handle(
          _reservationIdMeta,
          reservationId.isAcceptableOrUnknown(
              data['reservation_id']!, _reservationIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Bill map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Bill.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BillsTable createAlias(String alias) {
    return $BillsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $GuestsTable guests = $GuestsTable(this);
  late final $PricesTable prices = $PricesTable(this);
  late final $CoursesTable courses = $CoursesTable(this);
  late final $RoomsTable rooms = $RoomsTable(this);
  late final $ReservationsTable reservations = $ReservationsTable(this);
  late final $SessionsTable sessions = $SessionsTable(this);
  late final $BillsTable bills = $BillsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [guests, prices, courses, rooms, reservations, sessions, bills];
}
