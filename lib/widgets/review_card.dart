import 'package:flutter/material.dart';

import '../models/review.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Text(
                    review.name[0],
                    style: TextStyle(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.name,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        review.date,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                _StarRating(rating: review.rating),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              '"${review.comment}"',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontStyle: FontStyle.italic,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.85),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StarRating extends StatelessWidget {
  const _StarRating({required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    final full = rating.floor();
    final half = (rating - full) >= 0.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < full; i++)
          const Icon(Icons.star_rounded, size: 18, color: Color(0xFFF59E0B)),
        if (half)
          const Icon(Icons.star_half_rounded, size: 18, color: Color(0xFFF59E0B)),
        for (int i = 0; i < 5 - full - (half ? 1 : 0); i++)
          const Icon(Icons.star_outline_rounded, size: 18, color: Color(0xFFF59E0B)),
      ],
    );
  }
}
