import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../portfolio_scope.dart';
import '../widgets/hero_banner.dart';
import '../widgets/service_card.dart';
import '../widgets/stat_chip.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onTabChange});

  final ValueChanged<int> onTabChange;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final featured = PortfolioScope.of(context).services.take(4).toList();
    // CustomScrollView + SliverGrid avoids nested ListView + shrinkWrap GridView,
    // which can break scrolling on some Android layouts.
    return CustomScrollView(
      primary: false,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeroBanner(
                  title: kHandymanTagline,
                  subtitle: '12 years of reliable home repair in Thunder Bay.',
                  onCallPressed: () => _showSnack(context, 'Calling $kPhone …'),
                  onBookPressed: () => onTabChange(4), // Contact tab
                  onPortfolioPressed: () => onTabChange(2), // Portfolio tab
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: StatChip(
                        value: '$kYearsExperience',
                        label: 'Years Exp.',
                        icon: Icons.workspace_premium,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: StatChip(
                        value: '$kProjectsCompleted+',
                        label: 'Projects',
                        icon: Icons.task_alt,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: StatChip(
                        value: '$kRepeatClients%',
                        label: 'Repeat Clients',
                        icon: Icons.people,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                Text(
                  'Featured Services',
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.95,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, i) => ServiceCard(
                service: featured[i],
                onTap: () => onTabChange(1),
              ),
              childCount: featured.length,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          sliver: SliverToBoxAdapter(
            child: Center(
              child: TextButton.icon(
                onPressed: () => onTabChange(1),
                icon: const Icon(Icons.arrow_forward, size: 18),
                label: const Text('View All Services'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(msg)));
  }
}
