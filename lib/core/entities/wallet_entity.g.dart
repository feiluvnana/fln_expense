// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WalletEntity extends WalletEntity {
  @override
  final int id;
  @override
  final String name;
  @override
  final int icon;
  @override
  final int moneyAmount;

  factory _$WalletEntity([void Function(WalletEntityBuilder)? updates]) =>
      (new WalletEntityBuilder()..update(updates))._build();

  _$WalletEntity._(
      {required this.id,
      required this.name,
      required this.icon,
      required this.moneyAmount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'WalletEntity', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'WalletEntity', 'name');
    BuiltValueNullFieldError.checkNotNull(icon, r'WalletEntity', 'icon');
    BuiltValueNullFieldError.checkNotNull(
        moneyAmount, r'WalletEntity', 'moneyAmount');
  }

  @override
  WalletEntity rebuild(void Function(WalletEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WalletEntityBuilder toBuilder() => new WalletEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WalletEntity &&
        id == other.id &&
        name == other.name &&
        icon == other.icon &&
        moneyAmount == other.moneyAmount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, moneyAmount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WalletEntity')
          ..add('id', id)
          ..add('name', name)
          ..add('icon', icon)
          ..add('moneyAmount', moneyAmount))
        .toString();
  }
}

class WalletEntityBuilder
    implements Builder<WalletEntity, WalletEntityBuilder> {
  _$WalletEntity? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _icon;
  int? get icon => _$this._icon;
  set icon(int? icon) => _$this._icon = icon;

  int? _moneyAmount;
  int? get moneyAmount => _$this._moneyAmount;
  set moneyAmount(int? moneyAmount) => _$this._moneyAmount = moneyAmount;

  WalletEntityBuilder();

  WalletEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _icon = $v.icon;
      _moneyAmount = $v.moneyAmount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WalletEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WalletEntity;
  }

  @override
  void update(void Function(WalletEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WalletEntity build() => _build();

  _$WalletEntity _build() {
    final _$result = _$v ??
        new _$WalletEntity._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'WalletEntity', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'WalletEntity', 'name'),
            icon: BuiltValueNullFieldError.checkNotNull(
                icon, r'WalletEntity', 'icon'),
            moneyAmount: BuiltValueNullFieldError.checkNotNull(
                moneyAmount, r'WalletEntity', 'moneyAmount'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
