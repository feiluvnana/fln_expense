import 'package:flnexpense/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: FlnExpense()));
}

class FlnExpense extends StatelessWidget {
  const FlnExpense({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
        seedColor: Colors.green, brightness: Brightness.light);

    final theme = ThemeData(
        fontFamily: "SFText",
        textTheme: const TextTheme()
            .apply(fontFamily: "SFText", bodyColor: colorScheme.onSurface),
        colorScheme: colorScheme);

    return SafeArea(
        bottom: false,
        child: MaterialApp(
            theme: theme,
            debugShowCheckedModeBanner: false,
            home: const HomePage()));
  }
}
