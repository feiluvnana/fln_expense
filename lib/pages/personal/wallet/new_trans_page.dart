import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flnexpense/common/colors.dart';
import 'package:flnexpense/common/helper.dart';
import 'package:flnexpense/common/text.dart';
import 'package:flnexpense/services/database/database.dart';
import 'package:flnexpense/providers/transfer_provider.dart';
import 'package:flnexpense/providers/wallet_provider.dart';
import 'package:flnexpense/widgets/datepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class NewTransPage extends HookConsumerWidget {
  const NewTransPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allWal = ref.watch(getAllWalletProvider).valueOrNull;
    final toWallet = useState<int?>(null);
    final fromWallet = useState<int?>(null);
    final moneyAmount = useTextEditingController(text: "0đ");
    final date = useTextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: green100,
      appBar: AppBar(
          backgroundColor: green100,
          leading: IconButton(
              onPressed: Navigator.of(context).pop,
              icon: const FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white)),
          centerTitle: true,
          title: Text("Chuyển khoản", style: title1.copyWith(color: Colors.white))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text("Số tiền chuyển", style: regular.copyWith(color: light60))),
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
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
            child: Column(
              children: [
                const SizedBox(height: 16),
                DropdownButtonFormField2<int>(
                    buttonStyleData:
                        const ButtonStyleData(height: 56, padding: EdgeInsets.only(right: 12)),
                    menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
                    decoration:
                        const InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 4)),
                    dropdownStyleData:
                        const DropdownStyleData(maxHeight: kMinInteractiveDimension * 4),
                    iconStyleData: const IconStyleData(icon: Icon(FontAwesomeIcons.chevronDown)),
                    items: (allWal ?? <WalletData>[])
                        .map((e) => DropdownMenuItem(
                            value: e.id,
                            child: Row(
                              children: [
                                SizedBox(
                                    width: 24,
                                    child: Center(
                                        child: FaIcon(getIconDataFromStr(e.iconType, e.icon),
                                            size: 16, color: green100))),
                                Text(" ${e.name}"),
                              ],
                            )))
                        .toList(),
                    value: fromWallet.value,
                    onChanged: (val) => fromWallet.value = val,
                    hint: const Text("Từ"),
                    validator: (val) => val != null ? null : "Không được để trống."),
                const SizedBox(height: 16),
                DropdownButtonFormField2<int>(
                    buttonStyleData:
                        const ButtonStyleData(height: 56, padding: EdgeInsets.only(right: 12)),
                    menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
                    decoration:
                        const InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 4)),
                    dropdownStyleData:
                        const DropdownStyleData(maxHeight: kMinInteractiveDimension * 4),
                    iconStyleData: const IconStyleData(icon: Icon(FontAwesomeIcons.chevronDown)),
                    items: (allWal ?? <WalletData>[])
                        .map((e) => DropdownMenuItem(
                            value: e.id,
                            child: Row(
                              children: [
                                SizedBox(
                                    width: 24,
                                    child: Center(
                                        child: FaIcon(getIconDataFromStr(e.iconType, e.icon),
                                            size: 16, color: green100))),
                                Text(" ${e.name}"),
                              ],
                            )))
                        .toList(),
                    value: toWallet.value,
                    onChanged: (val) => toWallet.value = val,
                    hint: const Text("đến"),
                    validator: (val) => val != null ? null : "Không được để trống."),
                const SizedBox(height: 16),
                DatePickerFormField(controller: date),
                const SizedBox(height: 80),
                FilledButton(
                    onPressed: () async {
                      await ref.read(transferServiceProvider.notifier).insert(
                          toWallet: allWal!.firstWhere((e) => e.id == toWallet.value!),
                          fromWallet: allWal.firstWhere((e) => e.id == fromWallet.value!),
                          moneyAmount: int.parse(moneyAmount.text.replaceAll(RegExp("[^0-9]"), "")),
                          createdAt: DateFormat("dd/MM/yyyy").parse(date.text));
                      if (context.mounted) Navigator.of(context).pop();
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.check, size: 18),
                        SizedBox(width: 4),
                        Text("Hoàn thành"),
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
