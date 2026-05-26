import 'package:flutter/material.dart';

import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/home_screen.dart';
import 'screens/portfolio_screen.dart';
import 'screens/reviews_screen.dart';
import 'screens/services_screen.dart';

void main() => runApp(const HandymanApp());

class HandymanApp extends StatelessWidget {
  const HandymanApp({super.key});

  static const _seed = Color(0xFFD97706); // warm amber

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

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;

  void _onTabChange(int idx) {
    setState(() => _currentIndex = idx);
  }

  @override
  Widget build(BuildContext context) {
    final screens = <Widget>[
      HomeScreen(onTabChange: _onTabChange),
      const ServicesScreen(),
      const PortfolioScreen(),
      const ReviewsScreen(),
      const ContactScreen(),
    ];

    final titles = ['Home', 'Services', 'Portfolio', 'Reviews', 'Contact'];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_currentIndex]),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'About',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const _AboutPage()),
            ),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: IndexedStack(
            index: _currentIndex,
            children: screens,
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _onTabChange,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.build_outlined), selectedIcon: Icon(Icons.build), label: 'Services'),
          NavigationDestination(icon: Icon(Icons.photo_library_outlined), selectedIcon: Icon(Icons.photo_library), label: 'Portfolio'),
          NavigationDestination(icon: Icon(Icons.reviews_outlined), selectedIcon: Icon(Icons.reviews), label: 'Reviews'),
          NavigationDestination(icon: Icon(Icons.contact_mail_outlined), selectedIcon: Icon(Icons.contact_mail), label: 'Contact'),
        ],
      ),
    );
  }
}

class _AboutPage extends StatelessWidget {
  const _AboutPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: const AboutScreen(),
        ),
      ),
    );
  }
}
