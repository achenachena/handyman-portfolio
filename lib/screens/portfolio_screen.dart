import 'package:flutter/material.dart';

import '../portfolio_scope.dart';
import '../widgets/project_card.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final projects = PortfolioScope.of(context).projects;
    return ListView(
      primary: false,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      children: [
        Text(
          'Portfolio',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'A selection of recent projects.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        ...projects.map(
          (p) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ProjectCard(project: p),
          ),
        ),
      ],
    );
  }
}
