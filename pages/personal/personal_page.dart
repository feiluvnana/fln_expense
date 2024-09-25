import 'package:flnexpense/common/colors.dart';
import 'package:flnexpense/common/text.dart';
import 'package:flnexpense/features/wallet/wallet_page.dart';
import 'package:flnexpense/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'expense_category/expense_category_page.dart';
import 'income_category/income_category_page.dart';

class PersonalPage extends HookConsumerWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: green100.withOpacity(0.1),
      child: Column(children: [
        Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(children: [
                LeadingIconListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const WalletPage()));
                    },
                    color: green100,
                    title: const Text("Ví", style: title1),
                    icon: FontAwesomeIcons.wallet),
                const Divider(thickness: 0.5, height: 0.5),
                const LeadingIconListTile(
                    color: green100,
                    title: Text("Cài đặt", style: title1),
                    icon: FontAwesomeIcons.gear),
                const Divider(thickness: 0.5, height: 0.5),
                LeadingIconListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const IncomeCategoryPage()));
                    },
                    color: blue100,
                    title: const Text("Thêm hạng mục thu nhập", style: title1),
                    icon: FontAwesomeIcons.sackDollar),
                const Divider(thickness: 0.5, height: 0.5),
                LeadingIconListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const ExpenseCategoryPage()));
                    },
                    color: red100,
                    title: const Text("Thêm hạng mục chi tiêu", style: title1),
                    icon: FontAwesomeIcons.cartShopping),
              ]),
            ))
      ]),
    );
  }
}
