import 'package:flutter/material.dart';

import 'data/portfolio_repository.dart';
import 'models/project.dart';
import 'models/review.dart';
import 'models/service.dart';

/// Supplies portfolio lists + repository to the widget tree (backed by
/// Firestore in production or [MockPortfolioRepository] in tests / fallback).
class PortfolioScope extends InheritedWidget {
  const PortfolioScope({
    super.key,
    required this.repository,
    required this.services,
    required this.projects,
    required this.reviews,
    required super.child,
  });

  final PortfolioRepository repository;
  final List<Service> services;
  final List<Project> projects;
  final List<Review> reviews;

  static PortfolioScope of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<PortfolioScope>();
    if (scope == null) {
      throw FlutterError('PortfolioScope not found — wrap MaterialApp with PortfolioScope.');
    }
    return scope;
  }

  @override
  bool updateShouldNotify(PortfolioScope oldWidget) {
    return services != oldWidget.services ||
        projects != oldWidget.projects ||
        reviews != oldWidget.reviews ||
        repository != oldWidget.repository;
  }
}
