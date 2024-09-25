import 'package:built_value/built_value.dart';

part 'wallet_entity.g.dart';

abstract class WalletEntity
    implements Built<WalletEntity, WalletEntityBuilder> {
  const WalletEntity._();

  int get id;
  String get name;
  int get icon;
  int get moneyAmount;

  factory WalletEntity([void Function(WalletEntityBuilder) updates]) =
      _$WalletEntity;
}
