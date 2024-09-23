import 'package:flnexpense/providers/transfer_provider.dart';
import 'package:flnexpense/providers/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class TransPage extends HookConsumerWidget {
  const TransPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTrans = ref.watch(getAllTransferProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: Navigator.of(context).pop,
              icon: const FaIcon(FontAwesomeIcons.arrowLeft)),
          title: const Text("Lịch sử chuyển khoản")),
      body: SingleChildScrollView(
          child: Column(children: [
        ...?allTrans?.map((e) {
          final secondWallet = e.fromWalletId == null
              ? null
              : ref.watch(getWalletByIdProvider(e.fromWalletId!)).valueOrNull;
          final firstWallet =
              ref.watch(getWalletByIdProvider(e.toWalletId)).valueOrNull;
          return ListTile(
            title: Text(e.fromWalletId == null
                ? "${firstWallet?.name}"
                : "${secondWallet?.name} => ${firstWallet?.name}"),
            trailing: Text(NumberFormat("#,##0đ").format(e.moneyAmount)),
            subtitle:
                Text(e.fromWalletId == null ? "Số dư ban đầu" : "Chuyển khoản"),
          );
        })
      ])),
    );
  }
}
