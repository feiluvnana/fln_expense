import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flnexpense/common/colors.dart';
import 'package:flnexpense/common/helper.dart';
import 'package:flnexpense/common/text.dart';
import 'package:flnexpense/services/database/database.dart';
import 'package:flnexpense/widgets/datepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../providers/income_category_provider.dart';
import '../../providers/income_provider.dart';
import '../../providers/wallet_provider.dart';

class NewIncomePage extends HookConsumerWidget {
  const NewIncomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allWal = ref.watch(getAllWalletProvider).valueOrNull;
    final allInccat = ref.watch(getAllIncomeCategoryProvider).valueOrNull;
    final walletId = useState<int?>(null);
    final inccatId = useState<int?>(null);
    final moneyAmount = useTextEditingController(text: "0đ");
    final date = useTextEditingController();
    final note = useTextEditingController();

    return Scaffold(
      backgroundColor: blue100,
      appBar: AppBar(
          backgroundColor: blue100,
          leading: IconButton(
              onPressed: Navigator.of(context).pop,
              icon: const FaIcon(FontAwesomeIcons.arrowLeft,
                  color: Colors.white)),
          title: Text("Tạo thu nhập mới",
              style: title1.copyWith(color: Colors.white)),
          centerTitle: true),
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
            child: Column(children: [
              const SizedBox(height: 16),
              DropdownButtonFormField2<int>(
                  buttonStyleData: const ButtonStyleData(
                      height: 56, padding: EdgeInsets.only(right: 12)),
                  menuItemStyleData: const MenuItemStyleData(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 4)),
                  dropdownStyleData: const DropdownStyleData(
                      maxHeight: kMinInteractiveDimension * 4),
                  iconStyleData: const IconStyleData(
                      icon: Icon(FontAwesomeIcons.chevronDown)),
                  items: (allWal ?? <WalletData>[])
                      .map((e) => DropdownMenuItem(
                          value: e.id,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 24,
                                  child: Center(
                                      child: FaIcon(
                                          getIconDataFromStr(
                                              e.iconType, e.icon),
                                          size: 16,
                                          color: green100))),
                              Text(" ${e.name}"),
                            ],
                          )))
                      .toList(),
                  value: walletId.value,
                  onChanged: (val) => walletId.value = val,
                  hint: const Text("Tài khoản"),
                  validator: (val) =>
                      val != null ? null : "Không được để trống."),
              const SizedBox(height: 16),
              DropdownButtonFormField2<int>(
                  buttonStyleData: const ButtonStyleData(
                      height: 56, padding: EdgeInsets.only(right: 12)),
                  menuItemStyleData: const MenuItemStyleData(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 4)),
                  dropdownStyleData: const DropdownStyleData(
                      maxHeight: kMinInteractiveDimension * 4),
                  iconStyleData: const IconStyleData(
                      icon: Icon(FontAwesomeIcons.chevronDown)),
                  items: (allInccat ?? <IncomeCategoryData>[])
                      .map((e) => DropdownMenuItem(
                          value: e.id,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 24,
                                  child: Center(
                                      child: FaIcon(
                                          getIconDataFromStr(
                                              e.iconType, e.icon),
                                          size: 16,
                                          color: blue100))),
                              Text(" ${e.name}"),
                            ],
                          )))
                      .toList(),
                  value: inccatId.value,
                  onChanged: (val) => inccatId.value = val,
                  hint: const Text("Hạng mục"),
                  validator: (val) =>
                      val != null ? null : "Không được để trống."),
              const SizedBox(height: 16),
              DatePickerFormField(controller: date),
              const SizedBox(height: 16),
              TextFormField(
                  controller: note,
                  decoration: const InputDecoration(hintText: "Ghi chú")),
              const SizedBox(height: 80),
              FilledButton(
                  onPressed: () {
                    ref
                        .read(incomeServiceProvider.notifier)
                        .insert(
                            note: note.text.isEmpty ? null : note.text,
                            wallet: allWal!
                                .firstWhere((e) => e.id == walletId.value!),
                            incomeCategory: allInccat!
                                .firstWhere((e) => e.id == inccatId.value!),
                            moneyAmount: int.parse(moneyAmount.text
                                .replaceAll(RegExp("[^0-9]"), "")),
                            createdAt:
                                DateFormat("dd/MM/yyyy").parse(date.text))
                        .then((_) {
                      if (context.mounted) Navigator.of(context).pop();
                    });
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.check, size: 18),
                      SizedBox(width: 4),
                      Text("Hoàn thành"),
                    ],
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}
