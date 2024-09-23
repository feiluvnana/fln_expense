// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $WalletTable extends Wallet with TableInfo<$WalletTable, WalletData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WalletTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<int> icon = GeneratedColumn<int>(
      'icon', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _iconTypeMeta =
      const VerificationMeta('iconType');
  @override
  late final GeneratedColumn<String> iconType = GeneratedColumn<String>(
      'icon_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _moneyAmountMeta =
      const VerificationMeta('moneyAmount');
  @override
  late final GeneratedColumn<int> moneyAmount = GeneratedColumn<int>(
      'money_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, icon, iconType, moneyAmount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wallet';
  @override
  VerificationContext validateIntegrity(Insertable<WalletData> instance,
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
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('icon_type')) {
      context.handle(_iconTypeMeta,
          iconType.isAcceptableOrUnknown(data['icon_type']!, _iconTypeMeta));
    } else if (isInserting) {
      context.missing(_iconTypeMeta);
    }
    if (data.containsKey('money_amount')) {
      context.handle(
          _moneyAmountMeta,
          moneyAmount.isAcceptableOrUnknown(
              data['money_amount']!, _moneyAmountMeta));
    } else if (isInserting) {
      context.missing(_moneyAmountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WalletData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WalletData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}icon'])!,
      iconType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_type'])!,
      moneyAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}money_amount'])!,
    );
  }

  @override
  $WalletTable createAlias(String alias) {
    return $WalletTable(attachedDatabase, alias);
  }
}

class WalletData extends DataClass implements Insertable<WalletData> {
  final int id;
  final String name;
  final int icon;
  final String iconType;
  final int moneyAmount;
  const WalletData(
      {required this.id,
      required this.name,
      required this.icon,
      required this.iconType,
      required this.moneyAmount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['icon'] = Variable<int>(icon);
    map['icon_type'] = Variable<String>(iconType);
    map['money_amount'] = Variable<int>(moneyAmount);
    return map;
  }

  WalletCompanion toCompanion(bool nullToAbsent) {
    return WalletCompanion(
      id: Value(id),
      name: Value(name),
      icon: Value(icon),
      iconType: Value(iconType),
      moneyAmount: Value(moneyAmount),
    );
  }

  factory WalletData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WalletData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      icon: serializer.fromJson<int>(json['icon']),
      iconType: serializer.fromJson<String>(json['iconType']),
      moneyAmount: serializer.fromJson<int>(json['moneyAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'icon': serializer.toJson<int>(icon),
      'iconType': serializer.toJson<String>(iconType),
      'moneyAmount': serializer.toJson<int>(moneyAmount),
    };
  }

  WalletData copyWith(
          {int? id,
          String? name,
          int? icon,
          String? iconType,
          int? moneyAmount}) =>
      WalletData(
        id: id ?? this.id,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        iconType: iconType ?? this.iconType,
        moneyAmount: moneyAmount ?? this.moneyAmount,
      );
  WalletData copyWithCompanion(WalletCompanion data) {
    return WalletData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      icon: data.icon.present ? data.icon.value : this.icon,
      iconType: data.iconType.present ? data.iconType.value : this.iconType,
      moneyAmount:
          data.moneyAmount.present ? data.moneyAmount.value : this.moneyAmount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WalletData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('iconType: $iconType, ')
          ..write('moneyAmount: $moneyAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, icon, iconType, moneyAmount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WalletData &&
          other.id == this.id &&
          other.name == this.name &&
          other.icon == this.icon &&
          other.iconType == this.iconType &&
          other.moneyAmount == this.moneyAmount);
}

class WalletCompanion extends UpdateCompanion<WalletData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> icon;
  final Value<String> iconType;
  final Value<int> moneyAmount;
  const WalletCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.iconType = const Value.absent(),
    this.moneyAmount = const Value.absent(),
  });
  WalletCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int icon,
    required String iconType,
    required int moneyAmount,
  })  : name = Value(name),
        icon = Value(icon),
        iconType = Value(iconType),
        moneyAmount = Value(moneyAmount);
  static Insertable<WalletData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? icon,
    Expression<String>? iconType,
    Expression<int>? moneyAmount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (iconType != null) 'icon_type': iconType,
      if (moneyAmount != null) 'money_amount': moneyAmount,
    });
  }

  WalletCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? icon,
      Value<String>? iconType,
      Value<int>? moneyAmount}) {
    return WalletCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      iconType: iconType ?? this.iconType,
      moneyAmount: moneyAmount ?? this.moneyAmount,
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
    if (icon.present) {
      map['icon'] = Variable<int>(icon.value);
    }
    if (iconType.present) {
      map['icon_type'] = Variable<String>(iconType.value);
    }
    if (moneyAmount.present) {
      map['money_amount'] = Variable<int>(moneyAmount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WalletCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('iconType: $iconType, ')
          ..write('moneyAmount: $moneyAmount')
          ..write(')'))
        .toString();
  }
}

class $ExpenseCategoryTable extends ExpenseCategory
    with TableInfo<$ExpenseCategoryTable, ExpenseCategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpenseCategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<int> icon = GeneratedColumn<int>(
      'icon', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _iconTypeMeta =
      const VerificationMeta('iconType');
  @override
  late final GeneratedColumn<String> iconType = GeneratedColumn<String>(
      'icon_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, icon, iconType];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expense_category';
  @override
  VerificationContext validateIntegrity(
      Insertable<ExpenseCategoryData> instance,
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
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('icon_type')) {
      context.handle(_iconTypeMeta,
          iconType.isAcceptableOrUnknown(data['icon_type']!, _iconTypeMeta));
    } else if (isInserting) {
      context.missing(_iconTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExpenseCategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpenseCategoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}icon'])!,
      iconType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_type'])!,
    );
  }

  @override
  $ExpenseCategoryTable createAlias(String alias) {
    return $ExpenseCategoryTable(attachedDatabase, alias);
  }
}

class ExpenseCategoryData extends DataClass
    implements Insertable<ExpenseCategoryData> {
  final int id;
  final String name;
  final int icon;
  final String iconType;
  const ExpenseCategoryData(
      {required this.id,
      required this.name,
      required this.icon,
      required this.iconType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['icon'] = Variable<int>(icon);
    map['icon_type'] = Variable<String>(iconType);
    return map;
  }

  ExpenseCategoryCompanion toCompanion(bool nullToAbsent) {
    return ExpenseCategoryCompanion(
      id: Value(id),
      name: Value(name),
      icon: Value(icon),
      iconType: Value(iconType),
    );
  }

  factory ExpenseCategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpenseCategoryData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      icon: serializer.fromJson<int>(json['icon']),
      iconType: serializer.fromJson<String>(json['iconType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'icon': serializer.toJson<int>(icon),
      'iconType': serializer.toJson<String>(iconType),
    };
  }

  ExpenseCategoryData copyWith(
          {int? id, String? name, int? icon, String? iconType}) =>
      ExpenseCategoryData(
        id: id ?? this.id,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        iconType: iconType ?? this.iconType,
      );
  ExpenseCategoryData copyWithCompanion(ExpenseCategoryCompanion data) {
    return ExpenseCategoryData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      icon: data.icon.present ? data.icon.value : this.icon,
      iconType: data.iconType.present ? data.iconType.value : this.iconType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseCategoryData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('iconType: $iconType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, icon, iconType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseCategoryData &&
          other.id == this.id &&
          other.name == this.name &&
          other.icon == this.icon &&
          other.iconType == this.iconType);
}

class ExpenseCategoryCompanion extends UpdateCompanion<ExpenseCategoryData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> icon;
  final Value<String> iconType;
  const ExpenseCategoryCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.iconType = const Value.absent(),
  });
  ExpenseCategoryCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int icon,
    required String iconType,
  })  : name = Value(name),
        icon = Value(icon),
        iconType = Value(iconType);
  static Insertable<ExpenseCategoryData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? icon,
    Expression<String>? iconType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (iconType != null) 'icon_type': iconType,
    });
  }

  ExpenseCategoryCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? icon,
      Value<String>? iconType}) {
    return ExpenseCategoryCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      iconType: iconType ?? this.iconType,
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
    if (icon.present) {
      map['icon'] = Variable<int>(icon.value);
    }
    if (iconType.present) {
      map['icon_type'] = Variable<String>(iconType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseCategoryCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('iconType: $iconType')
          ..write(')'))
        .toString();
  }
}

class $IncomeCategoryTable extends IncomeCategory
    with TableInfo<$IncomeCategoryTable, IncomeCategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncomeCategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<int> icon = GeneratedColumn<int>(
      'icon', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _iconTypeMeta =
      const VerificationMeta('iconType');
  @override
  late final GeneratedColumn<String> iconType = GeneratedColumn<String>(
      'icon_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, icon, iconType];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'income_category';
  @override
  VerificationContext validateIntegrity(Insertable<IncomeCategoryData> instance,
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
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('icon_type')) {
      context.handle(_iconTypeMeta,
          iconType.isAcceptableOrUnknown(data['icon_type']!, _iconTypeMeta));
    } else if (isInserting) {
      context.missing(_iconTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IncomeCategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IncomeCategoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}icon'])!,
      iconType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_type'])!,
    );
  }

  @override
  $IncomeCategoryTable createAlias(String alias) {
    return $IncomeCategoryTable(attachedDatabase, alias);
  }
}

class IncomeCategoryData extends DataClass
    implements Insertable<IncomeCategoryData> {
  final int id;
  final String name;
  final int icon;
  final String iconType;
  const IncomeCategoryData(
      {required this.id,
      required this.name,
      required this.icon,
      required this.iconType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['icon'] = Variable<int>(icon);
    map['icon_type'] = Variable<String>(iconType);
    return map;
  }

  IncomeCategoryCompanion toCompanion(bool nullToAbsent) {
    return IncomeCategoryCompanion(
      id: Value(id),
      name: Value(name),
      icon: Value(icon),
      iconType: Value(iconType),
    );
  }

  factory IncomeCategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IncomeCategoryData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      icon: serializer.fromJson<int>(json['icon']),
      iconType: serializer.fromJson<String>(json['iconType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'icon': serializer.toJson<int>(icon),
      'iconType': serializer.toJson<String>(iconType),
    };
  }

  IncomeCategoryData copyWith(
          {int? id, String? name, int? icon, String? iconType}) =>
      IncomeCategoryData(
        id: id ?? this.id,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        iconType: iconType ?? this.iconType,
      );
  IncomeCategoryData copyWithCompanion(IncomeCategoryCompanion data) {
    return IncomeCategoryData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      icon: data.icon.present ? data.icon.value : this.icon,
      iconType: data.iconType.present ? data.iconType.value : this.iconType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IncomeCategoryData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('iconType: $iconType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, icon, iconType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomeCategoryData &&
          other.id == this.id &&
          other.name == this.name &&
          other.icon == this.icon &&
          other.iconType == this.iconType);
}

class IncomeCategoryCompanion extends UpdateCompanion<IncomeCategoryData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> icon;
  final Value<String> iconType;
  const IncomeCategoryCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.iconType = const Value.absent(),
  });
  IncomeCategoryCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int icon,
    required String iconType,
  })  : name = Value(name),
        icon = Value(icon),
        iconType = Value(iconType);
  static Insertable<IncomeCategoryData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? icon,
    Expression<String>? iconType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (iconType != null) 'icon_type': iconType,
    });
  }

  IncomeCategoryCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? icon,
      Value<String>? iconType}) {
    return IncomeCategoryCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      iconType: iconType ?? this.iconType,
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
    if (icon.present) {
      map['icon'] = Variable<int>(icon.value);
    }
    if (iconType.present) {
      map['icon_type'] = Variable<String>(iconType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncomeCategoryCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('iconType: $iconType')
          ..write(')'))
        .toString();
  }
}

class $TransferTable extends Transfer
    with TableInfo<$TransferTable, TransferData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransferTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _toWalletIdMeta =
      const VerificationMeta('toWalletId');
  @override
  late final GeneratedColumn<int> toWalletId = GeneratedColumn<int>(
      'to_wallet_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fromWalletIdMeta =
      const VerificationMeta('fromWalletId');
  @override
  late final GeneratedColumn<int> fromWalletId = GeneratedColumn<int>(
      'from_wallet_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _moneyAmountMeta =
      const VerificationMeta('moneyAmount');
  @override
  late final GeneratedColumn<int> moneyAmount = GeneratedColumn<int>(
      'money_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, toWalletId, fromWalletId, moneyAmount, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transfer';
  @override
  VerificationContext validateIntegrity(Insertable<TransferData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('to_wallet_id')) {
      context.handle(
          _toWalletIdMeta,
          toWalletId.isAcceptableOrUnknown(
              data['to_wallet_id']!, _toWalletIdMeta));
    } else if (isInserting) {
      context.missing(_toWalletIdMeta);
    }
    if (data.containsKey('from_wallet_id')) {
      context.handle(
          _fromWalletIdMeta,
          fromWalletId.isAcceptableOrUnknown(
              data['from_wallet_id']!, _fromWalletIdMeta));
    }
    if (data.containsKey('money_amount')) {
      context.handle(
          _moneyAmountMeta,
          moneyAmount.isAcceptableOrUnknown(
              data['money_amount']!, _moneyAmountMeta));
    } else if (isInserting) {
      context.missing(_moneyAmountMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransferData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransferData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      toWalletId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}to_wallet_id'])!,
      fromWalletId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}from_wallet_id']),
      moneyAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}money_amount'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TransferTable createAlias(String alias) {
    return $TransferTable(attachedDatabase, alias);
  }
}

class TransferData extends DataClass implements Insertable<TransferData> {
  final int id;
  final int toWalletId;
  final int? fromWalletId;
  final int moneyAmount;
  final DateTime createdAt;
  const TransferData(
      {required this.id,
      required this.toWalletId,
      this.fromWalletId,
      required this.moneyAmount,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['to_wallet_id'] = Variable<int>(toWalletId);
    if (!nullToAbsent || fromWalletId != null) {
      map['from_wallet_id'] = Variable<int>(fromWalletId);
    }
    map['money_amount'] = Variable<int>(moneyAmount);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TransferCompanion toCompanion(bool nullToAbsent) {
    return TransferCompanion(
      id: Value(id),
      toWalletId: Value(toWalletId),
      fromWalletId: fromWalletId == null && nullToAbsent
          ? const Value.absent()
          : Value(fromWalletId),
      moneyAmount: Value(moneyAmount),
      createdAt: Value(createdAt),
    );
  }

  factory TransferData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransferData(
      id: serializer.fromJson<int>(json['id']),
      toWalletId: serializer.fromJson<int>(json['toWalletId']),
      fromWalletId: serializer.fromJson<int?>(json['fromWalletId']),
      moneyAmount: serializer.fromJson<int>(json['moneyAmount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'toWalletId': serializer.toJson<int>(toWalletId),
      'fromWalletId': serializer.toJson<int?>(fromWalletId),
      'moneyAmount': serializer.toJson<int>(moneyAmount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TransferData copyWith(
          {int? id,
          int? toWalletId,
          Value<int?> fromWalletId = const Value.absent(),
          int? moneyAmount,
          DateTime? createdAt}) =>
      TransferData(
        id: id ?? this.id,
        toWalletId: toWalletId ?? this.toWalletId,
        fromWalletId:
            fromWalletId.present ? fromWalletId.value : this.fromWalletId,
        moneyAmount: moneyAmount ?? this.moneyAmount,
        createdAt: createdAt ?? this.createdAt,
      );
  TransferData copyWithCompanion(TransferCompanion data) {
    return TransferData(
      id: data.id.present ? data.id.value : this.id,
      toWalletId:
          data.toWalletId.present ? data.toWalletId.value : this.toWalletId,
      fromWalletId: data.fromWalletId.present
          ? data.fromWalletId.value
          : this.fromWalletId,
      moneyAmount:
          data.moneyAmount.present ? data.moneyAmount.value : this.moneyAmount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransferData(')
          ..write('id: $id, ')
          ..write('toWalletId: $toWalletId, ')
          ..write('fromWalletId: $fromWalletId, ')
          ..write('moneyAmount: $moneyAmount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, toWalletId, fromWalletId, moneyAmount, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransferData &&
          other.id == this.id &&
          other.toWalletId == this.toWalletId &&
          other.fromWalletId == this.fromWalletId &&
          other.moneyAmount == this.moneyAmount &&
          other.createdAt == this.createdAt);
}

class TransferCompanion extends UpdateCompanion<TransferData> {
  final Value<int> id;
  final Value<int> toWalletId;
  final Value<int?> fromWalletId;
  final Value<int> moneyAmount;
  final Value<DateTime> createdAt;
  const TransferCompanion({
    this.id = const Value.absent(),
    this.toWalletId = const Value.absent(),
    this.fromWalletId = const Value.absent(),
    this.moneyAmount = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TransferCompanion.insert({
    this.id = const Value.absent(),
    required int toWalletId,
    this.fromWalletId = const Value.absent(),
    required int moneyAmount,
    required DateTime createdAt,
  })  : toWalletId = Value(toWalletId),
        moneyAmount = Value(moneyAmount),
        createdAt = Value(createdAt);
  static Insertable<TransferData> custom({
    Expression<int>? id,
    Expression<int>? toWalletId,
    Expression<int>? fromWalletId,
    Expression<int>? moneyAmount,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (toWalletId != null) 'to_wallet_id': toWalletId,
      if (fromWalletId != null) 'from_wallet_id': fromWalletId,
      if (moneyAmount != null) 'money_amount': moneyAmount,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TransferCompanion copyWith(
      {Value<int>? id,
      Value<int>? toWalletId,
      Value<int?>? fromWalletId,
      Value<int>? moneyAmount,
      Value<DateTime>? createdAt}) {
    return TransferCompanion(
      id: id ?? this.id,
      toWalletId: toWalletId ?? this.toWalletId,
      fromWalletId: fromWalletId ?? this.fromWalletId,
      moneyAmount: moneyAmount ?? this.moneyAmount,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (toWalletId.present) {
      map['to_wallet_id'] = Variable<int>(toWalletId.value);
    }
    if (fromWalletId.present) {
      map['from_wallet_id'] = Variable<int>(fromWalletId.value);
    }
    if (moneyAmount.present) {
      map['money_amount'] = Variable<int>(moneyAmount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransferCompanion(')
          ..write('id: $id, ')
          ..write('toWalletId: $toWalletId, ')
          ..write('fromWalletId: $fromWalletId, ')
          ..write('moneyAmount: $moneyAmount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ExpenseTable extends Expense with TableInfo<$ExpenseTable, ExpenseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpenseTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _walletIdMeta =
      const VerificationMeta('walletId');
  @override
  late final GeneratedColumn<int> walletId = GeneratedColumn<int>(
      'wallet_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _expenseCategoryIdMeta =
      const VerificationMeta('expenseCategoryId');
  @override
  late final GeneratedColumn<int> expenseCategoryId = GeneratedColumn<int>(
      'expense_category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _moneyAmountMeta =
      const VerificationMeta('moneyAmount');
  @override
  late final GeneratedColumn<int> moneyAmount = GeneratedColumn<int>(
      'money_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, walletId, expenseCategoryId, moneyAmount, note, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expense';
  @override
  VerificationContext validateIntegrity(Insertable<ExpenseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('wallet_id')) {
      context.handle(_walletIdMeta,
          walletId.isAcceptableOrUnknown(data['wallet_id']!, _walletIdMeta));
    } else if (isInserting) {
      context.missing(_walletIdMeta);
    }
    if (data.containsKey('expense_category_id')) {
      context.handle(
          _expenseCategoryIdMeta,
          expenseCategoryId.isAcceptableOrUnknown(
              data['expense_category_id']!, _expenseCategoryIdMeta));
    } else if (isInserting) {
      context.missing(_expenseCategoryIdMeta);
    }
    if (data.containsKey('money_amount')) {
      context.handle(
          _moneyAmountMeta,
          moneyAmount.isAcceptableOrUnknown(
              data['money_amount']!, _moneyAmountMeta));
    } else if (isInserting) {
      context.missing(_moneyAmountMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExpenseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpenseData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      walletId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wallet_id'])!,
      expenseCategoryId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}expense_category_id'])!,
      moneyAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}money_amount'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ExpenseTable createAlias(String alias) {
    return $ExpenseTable(attachedDatabase, alias);
  }
}

class ExpenseData extends DataClass implements Insertable<ExpenseData> {
  final int id;
  final int walletId;
  final int expenseCategoryId;
  final int moneyAmount;
  final String? note;
  final DateTime createdAt;
  const ExpenseData(
      {required this.id,
      required this.walletId,
      required this.expenseCategoryId,
      required this.moneyAmount,
      this.note,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['wallet_id'] = Variable<int>(walletId);
    map['expense_category_id'] = Variable<int>(expenseCategoryId);
    map['money_amount'] = Variable<int>(moneyAmount);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ExpenseCompanion toCompanion(bool nullToAbsent) {
    return ExpenseCompanion(
      id: Value(id),
      walletId: Value(walletId),
      expenseCategoryId: Value(expenseCategoryId),
      moneyAmount: Value(moneyAmount),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
    );
  }

  factory ExpenseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpenseData(
      id: serializer.fromJson<int>(json['id']),
      walletId: serializer.fromJson<int>(json['walletId']),
      expenseCategoryId: serializer.fromJson<int>(json['expenseCategoryId']),
      moneyAmount: serializer.fromJson<int>(json['moneyAmount']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'walletId': serializer.toJson<int>(walletId),
      'expenseCategoryId': serializer.toJson<int>(expenseCategoryId),
      'moneyAmount': serializer.toJson<int>(moneyAmount),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ExpenseData copyWith(
          {int? id,
          int? walletId,
          int? expenseCategoryId,
          int? moneyAmount,
          Value<String?> note = const Value.absent(),
          DateTime? createdAt}) =>
      ExpenseData(
        id: id ?? this.id,
        walletId: walletId ?? this.walletId,
        expenseCategoryId: expenseCategoryId ?? this.expenseCategoryId,
        moneyAmount: moneyAmount ?? this.moneyAmount,
        note: note.present ? note.value : this.note,
        createdAt: createdAt ?? this.createdAt,
      );
  ExpenseData copyWithCompanion(ExpenseCompanion data) {
    return ExpenseData(
      id: data.id.present ? data.id.value : this.id,
      walletId: data.walletId.present ? data.walletId.value : this.walletId,
      expenseCategoryId: data.expenseCategoryId.present
          ? data.expenseCategoryId.value
          : this.expenseCategoryId,
      moneyAmount:
          data.moneyAmount.present ? data.moneyAmount.value : this.moneyAmount,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseData(')
          ..write('id: $id, ')
          ..write('walletId: $walletId, ')
          ..write('expenseCategoryId: $expenseCategoryId, ')
          ..write('moneyAmount: $moneyAmount, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, walletId, expenseCategoryId, moneyAmount, note, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseData &&
          other.id == this.id &&
          other.walletId == this.walletId &&
          other.expenseCategoryId == this.expenseCategoryId &&
          other.moneyAmount == this.moneyAmount &&
          other.note == this.note &&
          other.createdAt == this.createdAt);
}

class ExpenseCompanion extends UpdateCompanion<ExpenseData> {
  final Value<int> id;
  final Value<int> walletId;
  final Value<int> expenseCategoryId;
  final Value<int> moneyAmount;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  const ExpenseCompanion({
    this.id = const Value.absent(),
    this.walletId = const Value.absent(),
    this.expenseCategoryId = const Value.absent(),
    this.moneyAmount = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ExpenseCompanion.insert({
    this.id = const Value.absent(),
    required int walletId,
    required int expenseCategoryId,
    required int moneyAmount,
    this.note = const Value.absent(),
    required DateTime createdAt,
  })  : walletId = Value(walletId),
        expenseCategoryId = Value(expenseCategoryId),
        moneyAmount = Value(moneyAmount),
        createdAt = Value(createdAt);
  static Insertable<ExpenseData> custom({
    Expression<int>? id,
    Expression<int>? walletId,
    Expression<int>? expenseCategoryId,
    Expression<int>? moneyAmount,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (walletId != null) 'wallet_id': walletId,
      if (expenseCategoryId != null) 'expense_category_id': expenseCategoryId,
      if (moneyAmount != null) 'money_amount': moneyAmount,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ExpenseCompanion copyWith(
      {Value<int>? id,
      Value<int>? walletId,
      Value<int>? expenseCategoryId,
      Value<int>? moneyAmount,
      Value<String?>? note,
      Value<DateTime>? createdAt}) {
    return ExpenseCompanion(
      id: id ?? this.id,
      walletId: walletId ?? this.walletId,
      expenseCategoryId: expenseCategoryId ?? this.expenseCategoryId,
      moneyAmount: moneyAmount ?? this.moneyAmount,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (walletId.present) {
      map['wallet_id'] = Variable<int>(walletId.value);
    }
    if (expenseCategoryId.present) {
      map['expense_category_id'] = Variable<int>(expenseCategoryId.value);
    }
    if (moneyAmount.present) {
      map['money_amount'] = Variable<int>(moneyAmount.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseCompanion(')
          ..write('id: $id, ')
          ..write('walletId: $walletId, ')
          ..write('expenseCategoryId: $expenseCategoryId, ')
          ..write('moneyAmount: $moneyAmount, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $IncomeTable extends Income with TableInfo<$IncomeTable, IncomeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncomeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _walletIdMeta =
      const VerificationMeta('walletId');
  @override
  late final GeneratedColumn<int> walletId = GeneratedColumn<int>(
      'wallet_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _incomeCategoryIdMeta =
      const VerificationMeta('incomeCategoryId');
  @override
  late final GeneratedColumn<int> incomeCategoryId = GeneratedColumn<int>(
      'income_category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _moneyAmountMeta =
      const VerificationMeta('moneyAmount');
  @override
  late final GeneratedColumn<int> moneyAmount = GeneratedColumn<int>(
      'money_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, walletId, incomeCategoryId, moneyAmount, note, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'income';
  @override
  VerificationContext validateIntegrity(Insertable<IncomeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('wallet_id')) {
      context.handle(_walletIdMeta,
          walletId.isAcceptableOrUnknown(data['wallet_id']!, _walletIdMeta));
    } else if (isInserting) {
      context.missing(_walletIdMeta);
    }
    if (data.containsKey('income_category_id')) {
      context.handle(
          _incomeCategoryIdMeta,
          incomeCategoryId.isAcceptableOrUnknown(
              data['income_category_id']!, _incomeCategoryIdMeta));
    } else if (isInserting) {
      context.missing(_incomeCategoryIdMeta);
    }
    if (data.containsKey('money_amount')) {
      context.handle(
          _moneyAmountMeta,
          moneyAmount.isAcceptableOrUnknown(
              data['money_amount']!, _moneyAmountMeta));
    } else if (isInserting) {
      context.missing(_moneyAmountMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IncomeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IncomeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      walletId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wallet_id'])!,
      incomeCategoryId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}income_category_id'])!,
      moneyAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}money_amount'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $IncomeTable createAlias(String alias) {
    return $IncomeTable(attachedDatabase, alias);
  }
}

class IncomeData extends DataClass implements Insertable<IncomeData> {
  final int id;
  final int walletId;
  final int incomeCategoryId;
  final int moneyAmount;
  final String? note;
  final DateTime createdAt;
  const IncomeData(
      {required this.id,
      required this.walletId,
      required this.incomeCategoryId,
      required this.moneyAmount,
      this.note,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['wallet_id'] = Variable<int>(walletId);
    map['income_category_id'] = Variable<int>(incomeCategoryId);
    map['money_amount'] = Variable<int>(moneyAmount);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  IncomeCompanion toCompanion(bool nullToAbsent) {
    return IncomeCompanion(
      id: Value(id),
      walletId: Value(walletId),
      incomeCategoryId: Value(incomeCategoryId),
      moneyAmount: Value(moneyAmount),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
    );
  }

  factory IncomeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IncomeData(
      id: serializer.fromJson<int>(json['id']),
      walletId: serializer.fromJson<int>(json['walletId']),
      incomeCategoryId: serializer.fromJson<int>(json['incomeCategoryId']),
      moneyAmount: serializer.fromJson<int>(json['moneyAmount']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'walletId': serializer.toJson<int>(walletId),
      'incomeCategoryId': serializer.toJson<int>(incomeCategoryId),
      'moneyAmount': serializer.toJson<int>(moneyAmount),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  IncomeData copyWith(
          {int? id,
          int? walletId,
          int? incomeCategoryId,
          int? moneyAmount,
          Value<String?> note = const Value.absent(),
          DateTime? createdAt}) =>
      IncomeData(
        id: id ?? this.id,
        walletId: walletId ?? this.walletId,
        incomeCategoryId: incomeCategoryId ?? this.incomeCategoryId,
        moneyAmount: moneyAmount ?? this.moneyAmount,
        note: note.present ? note.value : this.note,
        createdAt: createdAt ?? this.createdAt,
      );
  IncomeData copyWithCompanion(IncomeCompanion data) {
    return IncomeData(
      id: data.id.present ? data.id.value : this.id,
      walletId: data.walletId.present ? data.walletId.value : this.walletId,
      incomeCategoryId: data.incomeCategoryId.present
          ? data.incomeCategoryId.value
          : this.incomeCategoryId,
      moneyAmount:
          data.moneyAmount.present ? data.moneyAmount.value : this.moneyAmount,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IncomeData(')
          ..write('id: $id, ')
          ..write('walletId: $walletId, ')
          ..write('incomeCategoryId: $incomeCategoryId, ')
          ..write('moneyAmount: $moneyAmount, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, walletId, incomeCategoryId, moneyAmount, note, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomeData &&
          other.id == this.id &&
          other.walletId == this.walletId &&
          other.incomeCategoryId == this.incomeCategoryId &&
          other.moneyAmount == this.moneyAmount &&
          other.note == this.note &&
          other.createdAt == this.createdAt);
}

class IncomeCompanion extends UpdateCompanion<IncomeData> {
  final Value<int> id;
  final Value<int> walletId;
  final Value<int> incomeCategoryId;
  final Value<int> moneyAmount;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  const IncomeCompanion({
    this.id = const Value.absent(),
    this.walletId = const Value.absent(),
    this.incomeCategoryId = const Value.absent(),
    this.moneyAmount = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  IncomeCompanion.insert({
    this.id = const Value.absent(),
    required int walletId,
    required int incomeCategoryId,
    required int moneyAmount,
    this.note = const Value.absent(),
    required DateTime createdAt,
  })  : walletId = Value(walletId),
        incomeCategoryId = Value(incomeCategoryId),
        moneyAmount = Value(moneyAmount),
        createdAt = Value(createdAt);
  static Insertable<IncomeData> custom({
    Expression<int>? id,
    Expression<int>? walletId,
    Expression<int>? incomeCategoryId,
    Expression<int>? moneyAmount,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (walletId != null) 'wallet_id': walletId,
      if (incomeCategoryId != null) 'income_category_id': incomeCategoryId,
      if (moneyAmount != null) 'money_amount': moneyAmount,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  IncomeCompanion copyWith(
      {Value<int>? id,
      Value<int>? walletId,
      Value<int>? incomeCategoryId,
      Value<int>? moneyAmount,
      Value<String?>? note,
      Value<DateTime>? createdAt}) {
    return IncomeCompanion(
      id: id ?? this.id,
      walletId: walletId ?? this.walletId,
      incomeCategoryId: incomeCategoryId ?? this.incomeCategoryId,
      moneyAmount: moneyAmount ?? this.moneyAmount,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (walletId.present) {
      map['wallet_id'] = Variable<int>(walletId.value);
    }
    if (incomeCategoryId.present) {
      map['income_category_id'] = Variable<int>(incomeCategoryId.value);
    }
    if (moneyAmount.present) {
      map['money_amount'] = Variable<int>(moneyAmount.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncomeCompanion(')
          ..write('id: $id, ')
          ..write('walletId: $walletId, ')
          ..write('incomeCategoryId: $incomeCategoryId, ')
          ..write('moneyAmount: $moneyAmount, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$FlnExpenseDatabase extends GeneratedDatabase {
  _$FlnExpenseDatabase(QueryExecutor e) : super(e);
  $FlnExpenseDatabaseManager get managers => $FlnExpenseDatabaseManager(this);
  late final $WalletTable wallet = $WalletTable(this);
  late final $ExpenseCategoryTable expenseCategory =
      $ExpenseCategoryTable(this);
  late final $IncomeCategoryTable incomeCategory = $IncomeCategoryTable(this);
  late final $TransferTable transfer = $TransferTable(this);
  late final $ExpenseTable expense = $ExpenseTable(this);
  late final $IncomeTable income = $IncomeTable(this);
  late final WalletDao walletDao = WalletDao(this as FlnExpenseDatabase);
  late final ExpenseCategoryDao expenseCategoryDao =
      ExpenseCategoryDao(this as FlnExpenseDatabase);
  late final IncomeCategoryDao incomeCategoryDao =
      IncomeCategoryDao(this as FlnExpenseDatabase);
  late final TransferDao transferDao = TransferDao(this as FlnExpenseDatabase);
  late final ExpenseDao expenseDao = ExpenseDao(this as FlnExpenseDatabase);
  late final IncomeDao incomeDao = IncomeDao(this as FlnExpenseDatabase);
  late final StatisticsDao statisticsDao =
      StatisticsDao(this as FlnExpenseDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [wallet, expenseCategory, incomeCategory, transfer, expense, income];
}

typedef $$WalletTableCreateCompanionBuilder = WalletCompanion Function({
  Value<int> id,
  required String name,
  required int icon,
  required String iconType,
  required int moneyAmount,
});
typedef $$WalletTableUpdateCompanionBuilder = WalletCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> icon,
  Value<String> iconType,
  Value<int> moneyAmount,
});

class $$WalletTableFilterComposer
    extends FilterComposer<_$FlnExpenseDatabase, $WalletTable> {
  $$WalletTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get iconType => $state.composableBuilder(
      column: $state.table.iconType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get moneyAmount => $state.composableBuilder(
      column: $state.table.moneyAmount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$WalletTableOrderingComposer
    extends OrderingComposer<_$FlnExpenseDatabase, $WalletTable> {
  $$WalletTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get iconType => $state.composableBuilder(
      column: $state.table.iconType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get moneyAmount => $state.composableBuilder(
      column: $state.table.moneyAmount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$WalletTableTableManager extends RootTableManager<
    _$FlnExpenseDatabase,
    $WalletTable,
    WalletData,
    $$WalletTableFilterComposer,
    $$WalletTableOrderingComposer,
    $$WalletTableCreateCompanionBuilder,
    $$WalletTableUpdateCompanionBuilder,
    (
      WalletData,
      BaseReferences<_$FlnExpenseDatabase, $WalletTable, WalletData>
    ),
    WalletData,
    PrefetchHooks Function()> {
  $$WalletTableTableManager(_$FlnExpenseDatabase db, $WalletTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WalletTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WalletTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> icon = const Value.absent(),
            Value<String> iconType = const Value.absent(),
            Value<int> moneyAmount = const Value.absent(),
          }) =>
              WalletCompanion(
            id: id,
            name: name,
            icon: icon,
            iconType: iconType,
            moneyAmount: moneyAmount,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int icon,
            required String iconType,
            required int moneyAmount,
          }) =>
              WalletCompanion.insert(
            id: id,
            name: name,
            icon: icon,
            iconType: iconType,
            moneyAmount: moneyAmount,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WalletTableProcessedTableManager = ProcessedTableManager<
    _$FlnExpenseDatabase,
    $WalletTable,
    WalletData,
    $$WalletTableFilterComposer,
    $$WalletTableOrderingComposer,
    $$WalletTableCreateCompanionBuilder,
    $$WalletTableUpdateCompanionBuilder,
    (
      WalletData,
      BaseReferences<_$FlnExpenseDatabase, $WalletTable, WalletData>
    ),
    WalletData,
    PrefetchHooks Function()>;
typedef $$ExpenseCategoryTableCreateCompanionBuilder = ExpenseCategoryCompanion
    Function({
  Value<int> id,
  required String name,
  required int icon,
  required String iconType,
});
typedef $$ExpenseCategoryTableUpdateCompanionBuilder = ExpenseCategoryCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<int> icon,
  Value<String> iconType,
});

class $$ExpenseCategoryTableFilterComposer
    extends FilterComposer<_$FlnExpenseDatabase, $ExpenseCategoryTable> {
  $$ExpenseCategoryTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get iconType => $state.composableBuilder(
      column: $state.table.iconType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ExpenseCategoryTableOrderingComposer
    extends OrderingComposer<_$FlnExpenseDatabase, $ExpenseCategoryTable> {
  $$ExpenseCategoryTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get iconType => $state.composableBuilder(
      column: $state.table.iconType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ExpenseCategoryTableTableManager extends RootTableManager<
    _$FlnExpenseDatabase,
    $ExpenseCategoryTable,
    ExpenseCategoryData,
    $$ExpenseCategoryTableFilterComposer,
    $$ExpenseCategoryTableOrderingComposer,
    $$ExpenseCategoryTableCreateCompanionBuilder,
    $$ExpenseCategoryTableUpdateCompanionBuilder,
    (
      ExpenseCategoryData,
      BaseReferences<_$FlnExpenseDatabase, $ExpenseCategoryTable,
          ExpenseCategoryData>
    ),
    ExpenseCategoryData,
    PrefetchHooks Function()> {
  $$ExpenseCategoryTableTableManager(
      _$FlnExpenseDatabase db, $ExpenseCategoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ExpenseCategoryTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ExpenseCategoryTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> icon = const Value.absent(),
            Value<String> iconType = const Value.absent(),
          }) =>
              ExpenseCategoryCompanion(
            id: id,
            name: name,
            icon: icon,
            iconType: iconType,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int icon,
            required String iconType,
          }) =>
              ExpenseCategoryCompanion.insert(
            id: id,
            name: name,
            icon: icon,
            iconType: iconType,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ExpenseCategoryTableProcessedTableManager = ProcessedTableManager<
    _$FlnExpenseDatabase,
    $ExpenseCategoryTable,
    ExpenseCategoryData,
    $$ExpenseCategoryTableFilterComposer,
    $$ExpenseCategoryTableOrderingComposer,
    $$ExpenseCategoryTableCreateCompanionBuilder,
    $$ExpenseCategoryTableUpdateCompanionBuilder,
    (
      ExpenseCategoryData,
      BaseReferences<_$FlnExpenseDatabase, $ExpenseCategoryTable,
          ExpenseCategoryData>
    ),
    ExpenseCategoryData,
    PrefetchHooks Function()>;
typedef $$IncomeCategoryTableCreateCompanionBuilder = IncomeCategoryCompanion
    Function({
  Value<int> id,
  required String name,
  required int icon,
  required String iconType,
});
typedef $$IncomeCategoryTableUpdateCompanionBuilder = IncomeCategoryCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<int> icon,
  Value<String> iconType,
});

class $$IncomeCategoryTableFilterComposer
    extends FilterComposer<_$FlnExpenseDatabase, $IncomeCategoryTable> {
  $$IncomeCategoryTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get iconType => $state.composableBuilder(
      column: $state.table.iconType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$IncomeCategoryTableOrderingComposer
    extends OrderingComposer<_$FlnExpenseDatabase, $IncomeCategoryTable> {
  $$IncomeCategoryTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get iconType => $state.composableBuilder(
      column: $state.table.iconType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$IncomeCategoryTableTableManager extends RootTableManager<
    _$FlnExpenseDatabase,
    $IncomeCategoryTable,
    IncomeCategoryData,
    $$IncomeCategoryTableFilterComposer,
    $$IncomeCategoryTableOrderingComposer,
    $$IncomeCategoryTableCreateCompanionBuilder,
    $$IncomeCategoryTableUpdateCompanionBuilder,
    (
      IncomeCategoryData,
      BaseReferences<_$FlnExpenseDatabase, $IncomeCategoryTable,
          IncomeCategoryData>
    ),
    IncomeCategoryData,
    PrefetchHooks Function()> {
  $$IncomeCategoryTableTableManager(
      _$FlnExpenseDatabase db, $IncomeCategoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$IncomeCategoryTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$IncomeCategoryTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> icon = const Value.absent(),
            Value<String> iconType = const Value.absent(),
          }) =>
              IncomeCategoryCompanion(
            id: id,
            name: name,
            icon: icon,
            iconType: iconType,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int icon,
            required String iconType,
          }) =>
              IncomeCategoryCompanion.insert(
            id: id,
            name: name,
            icon: icon,
            iconType: iconType,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$IncomeCategoryTableProcessedTableManager = ProcessedTableManager<
    _$FlnExpenseDatabase,
    $IncomeCategoryTable,
    IncomeCategoryData,
    $$IncomeCategoryTableFilterComposer,
    $$IncomeCategoryTableOrderingComposer,
    $$IncomeCategoryTableCreateCompanionBuilder,
    $$IncomeCategoryTableUpdateCompanionBuilder,
    (
      IncomeCategoryData,
      BaseReferences<_$FlnExpenseDatabase, $IncomeCategoryTable,
          IncomeCategoryData>
    ),
    IncomeCategoryData,
    PrefetchHooks Function()>;
typedef $$TransferTableCreateCompanionBuilder = TransferCompanion Function({
  Value<int> id,
  required int toWalletId,
  Value<int?> fromWalletId,
  required int moneyAmount,
  required DateTime createdAt,
});
typedef $$TransferTableUpdateCompanionBuilder = TransferCompanion Function({
  Value<int> id,
  Value<int> toWalletId,
  Value<int?> fromWalletId,
  Value<int> moneyAmount,
  Value<DateTime> createdAt,
});

class $$TransferTableFilterComposer
    extends FilterComposer<_$FlnExpenseDatabase, $TransferTable> {
  $$TransferTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get toWalletId => $state.composableBuilder(
      column: $state.table.toWalletId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get fromWalletId => $state.composableBuilder(
      column: $state.table.fromWalletId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get moneyAmount => $state.composableBuilder(
      column: $state.table.moneyAmount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TransferTableOrderingComposer
    extends OrderingComposer<_$FlnExpenseDatabase, $TransferTable> {
  $$TransferTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get toWalletId => $state.composableBuilder(
      column: $state.table.toWalletId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get fromWalletId => $state.composableBuilder(
      column: $state.table.fromWalletId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get moneyAmount => $state.composableBuilder(
      column: $state.table.moneyAmount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TransferTableTableManager extends RootTableManager<
    _$FlnExpenseDatabase,
    $TransferTable,
    TransferData,
    $$TransferTableFilterComposer,
    $$TransferTableOrderingComposer,
    $$TransferTableCreateCompanionBuilder,
    $$TransferTableUpdateCompanionBuilder,
    (
      TransferData,
      BaseReferences<_$FlnExpenseDatabase, $TransferTable, TransferData>
    ),
    TransferData,
    PrefetchHooks Function()> {
  $$TransferTableTableManager(_$FlnExpenseDatabase db, $TransferTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TransferTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TransferTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> toWalletId = const Value.absent(),
            Value<int?> fromWalletId = const Value.absent(),
            Value<int> moneyAmount = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TransferCompanion(
            id: id,
            toWalletId: toWalletId,
            fromWalletId: fromWalletId,
            moneyAmount: moneyAmount,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int toWalletId,
            Value<int?> fromWalletId = const Value.absent(),
            required int moneyAmount,
            required DateTime createdAt,
          }) =>
              TransferCompanion.insert(
            id: id,
            toWalletId: toWalletId,
            fromWalletId: fromWalletId,
            moneyAmount: moneyAmount,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TransferTableProcessedTableManager = ProcessedTableManager<
    _$FlnExpenseDatabase,
    $TransferTable,
    TransferData,
    $$TransferTableFilterComposer,
    $$TransferTableOrderingComposer,
    $$TransferTableCreateCompanionBuilder,
    $$TransferTableUpdateCompanionBuilder,
    (
      TransferData,
      BaseReferences<_$FlnExpenseDatabase, $TransferTable, TransferData>
    ),
    TransferData,
    PrefetchHooks Function()>;
typedef $$ExpenseTableCreateCompanionBuilder = ExpenseCompanion Function({
  Value<int> id,
  required int walletId,
  required int expenseCategoryId,
  required int moneyAmount,
  Value<String?> note,
  required DateTime createdAt,
});
typedef $$ExpenseTableUpdateCompanionBuilder = ExpenseCompanion Function({
  Value<int> id,
  Value<int> walletId,
  Value<int> expenseCategoryId,
  Value<int> moneyAmount,
  Value<String?> note,
  Value<DateTime> createdAt,
});

class $$ExpenseTableFilterComposer
    extends FilterComposer<_$FlnExpenseDatabase, $ExpenseTable> {
  $$ExpenseTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get walletId => $state.composableBuilder(
      column: $state.table.walletId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get expenseCategoryId => $state.composableBuilder(
      column: $state.table.expenseCategoryId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get moneyAmount => $state.composableBuilder(
      column: $state.table.moneyAmount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ExpenseTableOrderingComposer
    extends OrderingComposer<_$FlnExpenseDatabase, $ExpenseTable> {
  $$ExpenseTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get walletId => $state.composableBuilder(
      column: $state.table.walletId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get expenseCategoryId => $state.composableBuilder(
      column: $state.table.expenseCategoryId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get moneyAmount => $state.composableBuilder(
      column: $state.table.moneyAmount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ExpenseTableTableManager extends RootTableManager<
    _$FlnExpenseDatabase,
    $ExpenseTable,
    ExpenseData,
    $$ExpenseTableFilterComposer,
    $$ExpenseTableOrderingComposer,
    $$ExpenseTableCreateCompanionBuilder,
    $$ExpenseTableUpdateCompanionBuilder,
    (
      ExpenseData,
      BaseReferences<_$FlnExpenseDatabase, $ExpenseTable, ExpenseData>
    ),
    ExpenseData,
    PrefetchHooks Function()> {
  $$ExpenseTableTableManager(_$FlnExpenseDatabase db, $ExpenseTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ExpenseTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ExpenseTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> walletId = const Value.absent(),
            Value<int> expenseCategoryId = const Value.absent(),
            Value<int> moneyAmount = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ExpenseCompanion(
            id: id,
            walletId: walletId,
            expenseCategoryId: expenseCategoryId,
            moneyAmount: moneyAmount,
            note: note,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int walletId,
            required int expenseCategoryId,
            required int moneyAmount,
            Value<String?> note = const Value.absent(),
            required DateTime createdAt,
          }) =>
              ExpenseCompanion.insert(
            id: id,
            walletId: walletId,
            expenseCategoryId: expenseCategoryId,
            moneyAmount: moneyAmount,
            note: note,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ExpenseTableProcessedTableManager = ProcessedTableManager<
    _$FlnExpenseDatabase,
    $ExpenseTable,
    ExpenseData,
    $$ExpenseTableFilterComposer,
    $$ExpenseTableOrderingComposer,
    $$ExpenseTableCreateCompanionBuilder,
    $$ExpenseTableUpdateCompanionBuilder,
    (
      ExpenseData,
      BaseReferences<_$FlnExpenseDatabase, $ExpenseTable, ExpenseData>
    ),
    ExpenseData,
    PrefetchHooks Function()>;
typedef $$IncomeTableCreateCompanionBuilder = IncomeCompanion Function({
  Value<int> id,
  required int walletId,
  required int incomeCategoryId,
  required int moneyAmount,
  Value<String?> note,
  required DateTime createdAt,
});
typedef $$IncomeTableUpdateCompanionBuilder = IncomeCompanion Function({
  Value<int> id,
  Value<int> walletId,
  Value<int> incomeCategoryId,
  Value<int> moneyAmount,
  Value<String?> note,
  Value<DateTime> createdAt,
});

class $$IncomeTableFilterComposer
    extends FilterComposer<_$FlnExpenseDatabase, $IncomeTable> {
  $$IncomeTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get walletId => $state.composableBuilder(
      column: $state.table.walletId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get incomeCategoryId => $state.composableBuilder(
      column: $state.table.incomeCategoryId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get moneyAmount => $state.composableBuilder(
      column: $state.table.moneyAmount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$IncomeTableOrderingComposer
    extends OrderingComposer<_$FlnExpenseDatabase, $IncomeTable> {
  $$IncomeTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get walletId => $state.composableBuilder(
      column: $state.table.walletId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get incomeCategoryId => $state.composableBuilder(
      column: $state.table.incomeCategoryId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get moneyAmount => $state.composableBuilder(
      column: $state.table.moneyAmount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$IncomeTableTableManager extends RootTableManager<
    _$FlnExpenseDatabase,
    $IncomeTable,
    IncomeData,
    $$IncomeTableFilterComposer,
    $$IncomeTableOrderingComposer,
    $$IncomeTableCreateCompanionBuilder,
    $$IncomeTableUpdateCompanionBuilder,
    (
      IncomeData,
      BaseReferences<_$FlnExpenseDatabase, $IncomeTable, IncomeData>
    ),
    IncomeData,
    PrefetchHooks Function()> {
  $$IncomeTableTableManager(_$FlnExpenseDatabase db, $IncomeTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$IncomeTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$IncomeTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> walletId = const Value.absent(),
            Value<int> incomeCategoryId = const Value.absent(),
            Value<int> moneyAmount = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              IncomeCompanion(
            id: id,
            walletId: walletId,
            incomeCategoryId: incomeCategoryId,
            moneyAmount: moneyAmount,
            note: note,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int walletId,
            required int incomeCategoryId,
            required int moneyAmount,
            Value<String?> note = const Value.absent(),
            required DateTime createdAt,
          }) =>
              IncomeCompanion.insert(
            id: id,
            walletId: walletId,
            incomeCategoryId: incomeCategoryId,
            moneyAmount: moneyAmount,
            note: note,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$IncomeTableProcessedTableManager = ProcessedTableManager<
    _$FlnExpenseDatabase,
    $IncomeTable,
    IncomeData,
    $$IncomeTableFilterComposer,
    $$IncomeTableOrderingComposer,
    $$IncomeTableCreateCompanionBuilder,
    $$IncomeTableUpdateCompanionBuilder,
    (
      IncomeData,
      BaseReferences<_$FlnExpenseDatabase, $IncomeTable, IncomeData>
    ),
    IncomeData,
    PrefetchHooks Function()>;

class $FlnExpenseDatabaseManager {
  final _$FlnExpenseDatabase _db;
  $FlnExpenseDatabaseManager(this._db);
  $$WalletTableTableManager get wallet =>
      $$WalletTableTableManager(_db, _db.wallet);
  $$ExpenseCategoryTableTableManager get expenseCategory =>
      $$ExpenseCategoryTableTableManager(_db, _db.expenseCategory);
  $$IncomeCategoryTableTableManager get incomeCategory =>
      $$IncomeCategoryTableTableManager(_db, _db.incomeCategory);
  $$TransferTableTableManager get transfer =>
      $$TransferTableTableManager(_db, _db.transfer);
  $$ExpenseTableTableManager get expense =>
      $$ExpenseTableTableManager(_db, _db.expense);
  $$IncomeTableTableManager get income =>
      $$IncomeTableTableManager(_db, _db.income);
}

mixin _$WalletDaoMixin on DatabaseAccessor<FlnExpenseDatabase> {
  $WalletTable get wallet => attachedDatabase.wallet;
}
mixin _$ExpenseCategoryDaoMixin on DatabaseAccessor<FlnExpenseDatabase> {
  $ExpenseCategoryTable get expenseCategory => attachedDatabase.expenseCategory;
}
mixin _$IncomeCategoryDaoMixin on DatabaseAccessor<FlnExpenseDatabase> {
  $IncomeCategoryTable get incomeCategory => attachedDatabase.incomeCategory;
}
mixin _$TransferDaoMixin on DatabaseAccessor<FlnExpenseDatabase> {
  $TransferTable get transfer => attachedDatabase.transfer;
}
mixin _$ExpenseDaoMixin on DatabaseAccessor<FlnExpenseDatabase> {
  $ExpenseTable get expense => attachedDatabase.expense;
}
mixin _$IncomeDaoMixin on DatabaseAccessor<FlnExpenseDatabase> {
  $IncomeTable get income => attachedDatabase.income;
}
mixin _$StatisticsDaoMixin on DatabaseAccessor<FlnExpenseDatabase> {
  $ExpenseTable get expense => attachedDatabase.expense;
  $IncomeTable get income => attachedDatabase.income;
}
