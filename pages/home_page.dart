import 'package:flnexpense/common/colors.dart';
import 'package:flnexpense/common/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'main/main_page.dart';
import 'personal/personal_page.dart';
import 'statistics/statistics_page.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);
    final scaffoldKey = useMemoized(() => GlobalKey<ScaffoldState>());

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
            scrolledUnderElevation: 0,
            elevation: 0,
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
            leading: IconButton(
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                icon: const Icon(FontAwesomeIcons.bars)),
            centerTitle: true,
            title: Text(
                switch (currentIndex.value) {
                  2 => "Thống kê",
                  _ => "FlnExpense"
                },
                style: title1)),
        body: [
          const MainPage(),
          const PersonalPage(),
          const StatisticsPage()
        ][currentIndex.value],
        drawer: Drawer(
            child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      tileColor: currentIndex.value == 0
                          ? green100.withOpacity(0.2)
                          : null,
                      textColor: currentIndex.value == 0 ? green100 : null,
                      iconColor: currentIndex.value == 0 ? green100 : null,
                      leading: const Icon(FontAwesomeIcons.house),
                      title: const Text("Trang chủ"),
                      onTap: () => currentIndex.value = 0),
                  ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      tileColor: currentIndex.value == 1
                          ? green100.withOpacity(0.2)
                          : null,
                      textColor: currentIndex.value == 1 ? green100 : null,
                      iconColor: currentIndex.value == 1 ? green100 : null,
                      leading: const Icon(FontAwesomeIcons.person),
                      title: const Text("Cá nhân"),
                      onTap: () => currentIndex.value = 1),
                  ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      tileColor: currentIndex.value == 2
                          ? green100.withOpacity(0.2)
                          : null,
                      textColor: currentIndex.value == 2 ? green100 : null,
                      iconColor: currentIndex.value == 2 ? green100 : null,
                      leading: const Icon(FontAwesomeIcons.chartSimple),
                      title: const Text("Thống kê"),
                      onTap: () => currentIndex.value = 2),
                ],
              ),
            ),
          ],
        )));
  }
}
