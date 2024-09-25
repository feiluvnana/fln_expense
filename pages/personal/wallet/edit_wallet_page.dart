import 'package:flnexpense/common/colors.dart';
import 'package:flnexpense/common/helper.dart';
import 'package:flnexpense/common/text.dart';
import 'package:flnexpense/services/database/database.dart';
import 'package:flnexpense/widgets/icon_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../providers/wallet_provider.dart';

class EditWalletPage extends HookConsumerWidget {
  final WalletData wallet;
  const EditWalletPage({required this.wallet, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icon =
        useState<IconData>(getIconDataFromStr(wallet.iconType, wallet.icon));
    final name = useTextEditingController(text: wallet.name);
    final moneyAmount = useTextEditingController(
        text: NumberFormat("#,##0đ").format(wallet.moneyAmount));

    return Scaffold(
      backgroundColor: green100,
      appBar: AppBar(
          backgroundColor: green100,
          leading: IconButton(
              onPressed: Navigator.of(context).pop,
              icon:
                  const Icon(FontAwesomeIcons.arrowLeft, color: Colors.white)),
          centerTitle: true,
          title: Text("Chỉnh sửa ví",
              style: title1.copyWith(color: Colors.white))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text("Số tiền", style: regular.copyWith(color: light60))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: TextField(
                inputFormatters: [CurrencyTextFormatter()],
                controller: moneyAmount,
                cursorColor: Colors.white,
                style: display1.copyWith(color: Colors.white),
                decoration: const InputDecoration(
                    border: InputBorder.none, enabledBorder: InputBorder.none)),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                children: [
                  const SizedBox(width: 12),
                  const Text("Biểu tượng ví", style: regular),
                  InkWell(
                    onTap: () {
                      showDialog<IconData>(
                          context: context,
                          builder: (_) => const IconPickerDialog()).then((val) {
                        if (val == null) return;
                        icon.value = val;
                      });
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Icon(icon.value, color: green100)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                      hintText: "Tên ví",
                      hintStyle: regular.copyWith(color: Colors.black54))),
              const SizedBox(height: 80),
              FilledButton(
                  onPressed: () {
                    ref
                        .read(walletServiceProvider.notifier)
                        .update(
                            oldId: wallet.id,
                            iconData: icon.value,
                            name: name.text,
                            moneyAmount: int.parse(moneyAmount.text
                                .replaceAll(RegExp("[^0-9]"), "")))
                        .then((_) {
                      if (context.mounted) Navigator.of(context).pop();
                    });
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.check, size: 18),
                      SizedBox(width: 4),
                      Text("Hoàn tất sửa ví")
                    ],
                  ))
            ]),
          ),
        ],
      ),
    );
  }
}
