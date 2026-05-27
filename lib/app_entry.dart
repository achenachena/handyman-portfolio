import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'data/firestore_portfolio_repository.dart';
import 'data/firestore_seeder.dart';
import 'data/mock_portfolio_repository.dart';
import 'data/portfolio_repository.dart';
import 'handyman_app.dart';
import 'portfolio_scope.dart';

/// Loads portfolio data from **Firestore** when Firebase is configured
/// (`google-services.json` on Android, etc.); otherwise uses
/// [MockPortfolioRepository].
///
/// Pass [`forceMock: true`] in widget tests to skip Firebase.
class AppEntry extends StatefulWidget {
  const AppEntry({super.key, this.forceMock = false});

  final bool forceMock;

  @override
  State<AppEntry> createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> {
  bool _ready = false;
  PortfolioScope? _scope;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    if (widget.forceMock) {
      await _applyRepository(MockPortfolioRepository());
      return;
    }

    try {
      await Firebase.initializeApp();
      final repo = FirestorePortfolioRepository();
      await FirestoreSeeder.seedIfEmpty(FirebaseFirestore.instance);
      await _applyRepository(repo);
    } catch (e, st) {
      debugPrint('Firebase unavailable — using mock data. ($e)');
      if (kDebugMode) {
        debugPrintStack(stackTrace: st);
      }
      await _applyRepository(MockPortfolioRepository());
    }
  }

  Future<void> _applyRepository(PortfolioRepository repo) async {
    final services = await repo.getServices();
    final projects = await repo.getProjects();
    final reviews = await repo.getReviews();
    if (!mounted) return;
    setState(() {
      _scope = PortfolioScope(
        repository: repo,
        services: services,
        projects: projects,
        reviews: reviews,
        child: const HandymanApp(),
      );
      _ready = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready || _scope == null) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }
    return _scope!;
  }
}
