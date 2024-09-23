import 'package:flutter/material.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(children: [
            const SizedBox(width: 8),
            IconButton(
                onPressed: Scaffold.of(context).openDrawer,
                icon: const Icon(Icons.menu, size: 36)),
            const SizedBox(width: 6),
            const Text("Cá nhân",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600, height: 1))
          ]),
          const ListTile(
            leading: Icon(Icons.account_balance_wallet, size: 36),
            title: Text("Ví",
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600, height: 1)),
            subtitle: Text("Quản lý ví và đại loại thế.",
                style: TextStyle(fontSize: 12, height: 1)),
            trailing: Text("100.000đ"),
          ),
          const ListTile(
              leading: Icon(Icons.monetization_on, size: 36),
              title: Text("Hạng mục thu nhập",
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, height: 1)),
              subtitle: Text("Điều chỉnh hạng mục thu nhập của bạn.",
                  style: TextStyle(fontSize: 12, height: 1))),
          const ListTile(
              leading: Icon(Icons.money_off, size: 36),
              title: Text("Hạng mục chi tiêu",
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, height: 1)),
              subtitle: Text("Điều chỉnh hạng mục chi tiêu của bạn.",
                  style: TextStyle(fontSize: 12, height: 1))),
          const ListTile(
              leading: Icon(Icons.settings, size: 36),
              title: Text("Cài đặt",
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, height: 1)),
              subtitle: Text("Thiết lập hiển thị, ngôn ngữ,...",
                  style: TextStyle(fontSize: 12, height: 1)))
        ],
      ),
    );
  }
}
