import 'package:flnexpense/common/colors.dart';
import 'package:flnexpense/common/text.dart';
import 'package:flnexpense/core/logics/wallet_provider.dart';
import 'package:flnexpense/features/wallet/new_wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class WalletPage extends ConsumerWidget {
  const WalletPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallets = ref.watch(walletProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(),
          centerTitle: true,
          title: Text(
              "Ví${wallets?.isEmpty != false ? "" : " (${wallets!.length})"}",
              style: title1)),
      body: wallets?.isEmpty != false
          ? Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const Expanded(
                      child: Center(child: Text("Hãy tạo ví đầu tiên nào."))),
                  FilledButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const NewWalletPage()));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, size: 18),
                          SizedBox(width: 4),
                          Text("Tạo ví mới")
                        ],
                      ))
                ],
              ),
            )
          : Column(children: [
              Text("Tổng số tiền",
                  style: regular.copyWith(color: Colors.black54)),
              Text(
                  NumberFormat("#,##0đ").format(
                      wallets!.fold(0, (val, wal) => val + wal.moneyAmount)),
                  style: display2.copyWith(height: 1.2)),
              const SizedBox(height: 24),
              Row(children: [
                const Spacer(),
                Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (_) => const TransPage()));
                      },
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: green100.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16)),
                              padding: const EdgeInsets.all(12),
                              child:
                                  const Icon(Icons.history, color: green100)),
                          const Text("Lịch sử chuyển khoản",
                              textAlign: TextAlign.center)
                        ],
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: wallets.length < 2
                          ? null
                          : () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (_) => const NewTransPage()));
                            },
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: green100.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16)),
                              padding: const EdgeInsets.all(12),
                              child: const Icon(Icons.swap_horiz,
                                  color: green100)),
                          const Text("Giao dịch chuyển khoản mới",
                              textAlign: TextAlign.center)
                        ],
                      ),
                    )),
                const Spacer(),
              ]),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    ...wallets.map((e) => ListTile(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (_) => WalletInfoPage(wallet: e)));
                        },
                        title: Text(e.name, style: title1),
                        subtitle: Text(
                            NumberFormat("#,##0đ").format(e.moneyAmount),
                            style: regular.copyWith(
                                color: Colors.black54, height: 1.4)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (_) =>
                                  //         EditWalletPage(wallet: e)));
                                },
                                icon: const Icon(Icons.edit, color: green100)),
                            IconButton(
                                onPressed: () {
                                  // ref
                                  //     .read(walletServiceProvider.notifier)
                                  //     .delete(e);
                                },
                                icon: const Icon(Icons.delete, color: red100)),
                          ],
                        )))
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: FilledButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (_) => const NewWalletPage()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, size: 18),
                        SizedBox(width: 4),
                        Text("Tạo ví mới")
                      ],
                    )),
              )
            ]),
    );
  }
}
