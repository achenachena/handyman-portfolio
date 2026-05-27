import 'package:flutter/material.dart';

import '../portfolio_scope.dart';
import '../widgets/review_card.dart';

/// Own [ScrollController] + [Scrollbar] avoids PrimaryScrollController / sliver
/// edge cases on some Android builds where the list appears but won't drag.
class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final reviews = PortfolioScope.of(context).reviews;
    final avg = reviews.isEmpty
        ? 0.0
        : reviews.fold<double>(0, (s, r) => s + r.rating) / reviews.length;

    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      child: ListView.builder(
        controller: _scrollController,
        primary: false,
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        itemCount: 1 + reviews.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Customer Reviews',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star_rounded, color: Color(0xFFF59E0B), size: 20),
                    const SizedBox(width: 4),
                    Text(
                      avg.toStringAsFixed(1),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '(${reviews.length} reviews)',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            );
          }
          final r = reviews[index - 1];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ReviewCard(review: r),
          );
        },
      ),
    );
  }
}
