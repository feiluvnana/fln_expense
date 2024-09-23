import 'package:flnexpense/common/colors.dart';
import 'package:flnexpense/common/helper.dart';
import 'package:flnexpense/common/text.dart';
import 'package:flnexpense/pages/personal/wallet/edit_wallet_page.dart';
import 'package:flnexpense/pages/personal/wallet/new_trans_page.dart';
import 'package:flnexpense/pages/personal/wallet/new_wallet_page.dart';
import 'package:flnexpense/pages/personal/wallet/trans_page.dart';
import 'package:flnexpense/pages/personal/wallet/wallet_info_page.dart';
import 'package:flnexpense/providers/wallet_provider.dart';
import 'package:flnexpense/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class WalletPage extends HookConsumerWidget {
  const WalletPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allWal = ref.watch(getAllWalletProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: Navigator.of(context).pop, icon: const FaIcon(FontAwesomeIcons.arrowLeft)),
          centerTitle: true,
          title:
              Text("Ví${allWal?.isEmpty != false ? "" : " (${allWal!.length})"}", style: title1)),
      body: allWal?.isEmpty != false
          ? Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const Expanded(child: Center(child: Text("Hãy tạo ví đầu tiên nào."))),
                  FilledButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => const NewWalletPage()));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.plus, size: 18),
                          SizedBox(width: 4),
                          Text("Tạo ví mới")
                        ],
                      ))
                ],
              ),
            )
          : Column(children: [
              Text("Tổng số tiền", style: regular.copyWith(color: Colors.black54)),
              Text(
                  NumberFormat("#,##0đ")
                      .format(allWal!.fold(0, (val, wal) => val + wal.moneyAmount)),
                  style: display2.copyWith(height: 1.2)),
              const SizedBox(height: 24),
              Row(children: [
                const Spacer(),
                Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => const TransPage()));
                      },
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: green100.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16)),
                              padding: const EdgeInsets.all(12),
                              child: const Icon(FontAwesomeIcons.clockRotateLeft, color: green100)),
                          const Text("Lịch sử chuyển khoản", textAlign: TextAlign.center)
                        ],
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: allWal.length < 2
                          ? null
                          : () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) => const NewTransPage()));
                            },
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: green100.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16)),
                              padding: const EdgeInsets.all(12),
                              child: const FaIcon(FontAwesomeIcons.rightLeft, color: green100)),
                          const Text("Giao dịch chuyển khoản mới", textAlign: TextAlign.center)
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
                    ...allWal.map((e) => LeadingIconListTile(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => WalletInfoPage(wallet: e)));
                        },
                        color: green100,
                        icon: getIconDataFromStr(e.iconType, e.icon),
                        title: Text(e.name, style: title1),
                        subtitle: Text(NumberFormat("#,##0đ").format(e.moneyAmount),
                            style: regular.copyWith(color: Colors.black54, height: 1.4)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (_) => EditWalletPage(wallet: e)));
                                },
                                icon: const Icon(FontAwesomeIcons.pencil, color: green100)),
                            IconButton(
                                onPressed: () {
                                  ref.read(walletServiceProvider.notifier).delete(e);
                                },
                                icon: const Icon(FontAwesomeIcons.xmark, color: red100)),
                          ],
                        )))
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: FilledButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => const NewWalletPage()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.plus, size: 18),
                        SizedBox(width: 4),
                        Text("Tạo ví mới")
                      ],
                    )),
              )
            ]),
    );
  }
}
