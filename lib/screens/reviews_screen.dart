import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../widgets/review_card.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avg = kReviews.fold<double>(0, (s, r) => s + r.rating) / kReviews.length;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
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
              '(${kReviews.length} reviews)',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...kReviews.map(
          (r) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ReviewCard(review: r),
          ),
        ),
      ],
    );
  }
}
