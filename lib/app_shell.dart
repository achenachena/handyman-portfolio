import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/home_screen.dart';
import 'screens/portfolio_screen.dart';
import 'screens/reviews_screen.dart';
import 'screens/services_screen.dart';

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

  Widget _screenForIndex(int i) {
    return switch (i) {
      0 => HomeScreen(onTabChange: _onTabChange),
      1 => const ServicesScreen(),
      2 => const PortfolioScreen(),
      3 => ReviewsScreen(),
      4 => const ContactScreen(),
      _ => const SizedBox.shrink(),
    };
  }

  @override
  Widget build(BuildContext context) {
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
              MaterialPageRoute<void>(builder: (_) => const AboutRoutePage()),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final mq = MediaQuery.sizeOf(context);
                var maxW = constraints.maxWidth;
                var maxH = constraints.maxHeight;
                if (maxW <= 0 || !maxW.isFinite) maxW = mq.width;
                if (maxH <= 0 || !maxH.isFinite) maxH = mq.height;
                final w = math.min(600.0, maxW);
                return Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: w,
                    height: maxH,
                    child: KeyedSubtree(
                      key: ValueKey<int>(_currentIndex),
                      child: _screenForIndex(_currentIndex),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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

class AboutRoutePage extends StatelessWidget {
  const AboutRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final mq = MediaQuery.sizeOf(context);
                var maxW = constraints.maxWidth;
                var maxH = constraints.maxHeight;
                if (maxW <= 0 || !maxW.isFinite) maxW = mq.width;
                if (maxH <= 0 || !maxH.isFinite) maxH = mq.height;
                final w = math.min(600.0, maxW);
                return Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: w,
                    height: maxH,
                    child: const AboutScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
