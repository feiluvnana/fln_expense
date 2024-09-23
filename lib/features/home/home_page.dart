import 'package:flnexpense/features/personal/persontal_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: [const PersonalPage()][currentIndex],
        drawer: const NavigationDrawer(children: [
          SizedBox(height: 16),
          NavigationDrawerDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: Text("Cá nhân"))
        ]));
  }
}
