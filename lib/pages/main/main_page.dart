import 'package:flnexpense/common/colors.dart';
import 'package:flnexpense/common/helper.dart';
import 'package:flnexpense/common/text.dart';
import 'package:flnexpense/services/database/database.dart';
import 'package:flnexpense/pages/main/new_expense_page.dart';
import 'package:flnexpense/pages/main/new_income_page.dart';
import 'package:flnexpense/providers/expense_category_provider.dart';
import 'package:flnexpense/providers/expense_provider.dart';
import 'package:flnexpense/providers/income_category_provider.dart';
import 'package:flnexpense/providers/income_provider.dart';
import 'package:flnexpense/widgets/fab_dial.dart';
import 'package:flnexpense/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allExp = ref.watch(getAllExpenseProvider).valueOrNull;
    var allInc = ref.watch(getAllIncomeProvider).valueOrNull;

    var allTransaction = [...?allInc, ...?allExp];
    allTransaction.sort((a, b) {
      DateTime aTime, bTime;
      if (a case ExpenseData val) {
        aTime = val.createdAt;
      } else {
        aTime = (a as IncomeData).createdAt;
      }
      if (b case ExpenseData val) {
        bTime = val.createdAt;
      } else {
        bTime = (b as IncomeData).createdAt;
      }
      return aTime.compareTo(bTime);
    });

    return Scaffold(
        floatingActionButton: Theme(
          data: Theme.of(context)
              .copyWith(shadowColor: Colors.transparent, applyElevationOverlayColor: false),
          child: FabDial(distance: 100, children: [
            FloatingActionButton(
                backgroundColor: red100.withOpacity(0.2),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const NewExpPage()));
                },
                child: const Icon(FontAwesomeIcons.cartShopping, color: red100)),
            FloatingActionButton(
                backgroundColor: blue100.withOpacity(0.2),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => const NewIncomePage()));
                },
                child: const Icon(FontAwesomeIcons.sackDollar, color: blue100))
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Các giao dịch gần đây", style: title1),
                const SizedBox(height: 16),
                ...allTransaction.map((e) {
                  if (e case ExpenseData val) {
                    final expcat = ref
                        .watch(getExpenseCategoryByIdProvider(val.expenseCategoryId))
                        .valueOrNull;
                    return LeadingIconListTile(
                        color: red100,
                        icon: getIconDataFromStr(expcat?.iconType, expcat?.icon ?? 0),
                        title: Text(expcat?.name ?? "", style: title1),
                        subtitle: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: DateFormat("d 'tháng' M, yyyy").format(val.createdAt),
                              style: small.copyWith(color: Colors.black54)),
                          if (e.note != null)
                            TextSpan(
                                text: "\n${e.note}",
                                style: small.copyWith(
                                    fontStyle: FontStyle.italic, color: Colors.black54))
                        ])),
                        trailing: Text(NumberFormat("-#,##0đ").format(val.moneyAmount),
                            style: title2.copyWith(color: red100)));
                  } else {
                    final val = (e as IncomeData);
                    final inccat =
                        ref.watch(getIncomeCategoryByIdProvider(val.incomeCategoryId)).valueOrNull;
                    return LeadingIconListTile(
                        color: blue100,
                        icon: getIconDataFromStr(inccat?.iconType, inccat?.icon ?? 0),
                        title: Text(inccat?.name ?? "", style: title1),
                        subtitle: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: DateFormat("d 'tháng' M, yyyy").format(val.createdAt),
                              style: small.copyWith(color: Colors.black54)),
                          if (e.note != null)
                            TextSpan(
                                text: "\n${e.note}",
                                style: small.copyWith(
                                    fontStyle: FontStyle.italic, color: Colors.black54))
                        ])),
                        trailing: Text(NumberFormat("+#,##0đ").format(val.moneyAmount),
                            style: title2.copyWith(color: blue100)));
                  }
                })
              ],
            ),
          ),
        ));
  }
}
