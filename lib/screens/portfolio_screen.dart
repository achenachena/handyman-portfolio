import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../widgets/project_card.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
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
        ...kProjects.map(
          (p) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ProjectCard(project: p),
          ),
        ),
      ],
    );
  }
}
