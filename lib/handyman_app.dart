import 'package:flutter/material.dart';

import 'app_shell.dart';

class HandymanApp extends StatelessWidget {
  const HandymanApp({super.key});

  static const _seed = Color(0xFFD97706);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Handyman Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: _seed,
        brightness: Brightness.light,
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      home: const AppShell(),
    );
  }
}
