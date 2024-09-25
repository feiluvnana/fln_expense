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
  static const VerificationMeta _moneyAmountMeta =
      const VerificationMeta('moneyAmount');
  @override
  late final GeneratedColumn<int> moneyAmount = GeneratedColumn<int>(
      'money_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, icon, moneyAmount];
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
  final int moneyAmount;
  const WalletData(
      {required this.id,
      required this.name,
      required this.icon,
      required this.moneyAmount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['icon'] = Variable<int>(icon);
    map['money_amount'] = Variable<int>(moneyAmount);
    return map;
  }

  WalletCompanion toCompanion(bool nullToAbsent) {
    return WalletCompanion(
      id: Value(id),
      name: Value(name),
      icon: Value(icon),
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
      'moneyAmount': serializer.toJson<int>(moneyAmount),
    };
  }

  WalletData copyWith({int? id, String? name, int? icon, int? moneyAmount}) =>
      WalletData(
        id: id ?? this.id,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        moneyAmount: moneyAmount ?? this.moneyAmount,
      );
  WalletData copyWithCompanion(WalletCompanion data) {
    return WalletData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      icon: data.icon.present ? data.icon.value : this.icon,
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
          ..write('moneyAmount: $moneyAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, icon, moneyAmount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WalletData &&
          other.id == this.id &&
          other.name == this.name &&
          other.icon == this.icon &&
          other.moneyAmount == this.moneyAmount);
}

class WalletCompanion extends UpdateCompanion<WalletData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> icon;
  final Value<int> moneyAmount;
  const WalletCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.moneyAmount = const Value.absent(),
  });
  WalletCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int icon,
    required int moneyAmount,
  })  : name = Value(name),
        icon = Value(icon),
        moneyAmount = Value(moneyAmount);
  static Insertable<WalletData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? icon,
    Expression<int>? moneyAmount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (moneyAmount != null) 'money_amount': moneyAmount,
    });
  }

  WalletCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? icon,
      Value<int>? moneyAmount}) {
    return WalletCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
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
          ..write('moneyAmount: $moneyAmount')
          ..write(')'))
        .toString();
  }
}

abstract class _$FlnExpenseDatabase extends GeneratedDatabase {
  _$FlnExpenseDatabase(QueryExecutor e) : super(e);
  $FlnExpenseDatabaseManager get managers => $FlnExpenseDatabaseManager(this);
  late final $WalletTable wallet = $WalletTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [wallet];
}

typedef $$WalletTableCreateCompanionBuilder = WalletCompanion Function({
  Value<int> id,
  required String name,
  required int icon,
  required int moneyAmount,
});
typedef $$WalletTableUpdateCompanionBuilder = WalletCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> icon,
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
            Value<int> moneyAmount = const Value.absent(),
          }) =>
              WalletCompanion(
            id: id,
            name: name,
            icon: icon,
            moneyAmount: moneyAmount,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int icon,
            required int moneyAmount,
          }) =>
              WalletCompanion.insert(
            id: id,
            name: name,
            icon: icon,
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

class $FlnExpenseDatabaseManager {
  final _$FlnExpenseDatabase _db;
  $FlnExpenseDatabaseManager(this._db);
  $$WalletTableTableManager get wallet =>
      $$WalletTableTableManager(_db, _db.wallet);
}
