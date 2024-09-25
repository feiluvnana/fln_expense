import 'package:flnexpense/common/colors.dart';
import 'package:flnexpense/common/text.dart';
import 'package:flnexpense/core/entities/wallet_entity.dart';
import 'package:flnexpense/core/logics/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewWalletPage extends ConsumerStatefulWidget {
  const NewWalletPage({super.key});

  @override
  ConsumerState<NewWalletPage> createState() => _NewWalletPageState();
}

class _NewWalletPageState extends ConsumerState<NewWalletPage> {
  final icon = Icons.question_mark;
  final name = TextEditingController();
  final moneyAmount = TextEditingController(text: "0đ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green100,
      appBar: AppBar(
          backgroundColor: green100,
          leading: IconButton(
              onPressed: Navigator.of(context).pop,
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
          centerTitle: true,
          title:
              Text("Tạo ví mới", style: title1.copyWith(color: Colors.white))),
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
                      // showDialog<IconData>(
                      //     context: context,
                      //     builder: (_) => const IconPickerDialog()).then((val) {
                      //   if (val == null) return;
                      //   icon.value = val;
                      // });
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Icon(icon, color: green100)),
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
                        .read(walletProvider.notifier)
                        .createWallet(WalletEntity((u) => u
                          ..id = 0
                          ..icon = icon.codePoint
                          ..name = name.text
                          ..moneyAmount = int.parse(moneyAmount.text
                              .replaceAll(RegExp("[^0-9]"), ""))))
                        .then((_) {
                      print(_);
                      if (context.mounted) Navigator.of(context).pop();
                    });
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check, size: 18),
                      SizedBox(width: 4),
                      Text("Hoàn tất tạo ví")
                    ],
                  ))
            ]),
          ),
        ],
      ),
    );
  }
}
