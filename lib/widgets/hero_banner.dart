import 'package:flutter/material.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({
    super.key,
    required this.title,
    required this.subtitle,
    this.onCallPressed,
    this.onBookPressed,
    this.onPortfolioPressed,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onCallPressed;
  final VoidCallback? onBookPressed;
  final VoidCallback? onPortfolioPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withValues(alpha: 0.85),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.handyman, color: theme.colorScheme.onPrimary, size: 28),
              const SizedBox(width: 8),
              Text(
                'Jake Morrison',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onPrimary.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.85),
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              if (onCallPressed != null)
                _ActionButton(
                  icon: Icons.phone,
                  label: 'Call',
                  onPressed: onCallPressed!,
                  filled: true,
                ),
              if (onBookPressed != null)
                _ActionButton(
                  icon: Icons.calendar_month,
                  label: 'Book',
                  onPressed: onBookPressed!,
                  filled: false,
                ),
              if (onPortfolioPressed != null)
                _ActionButton(
                  icon: Icons.photo_library,
                  label: 'Portfolio',
                  onPressed: onPortfolioPressed!,
                  filled: false,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.filled,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    if (filled) {
      return FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.onPrimary,
          foregroundColor: colorScheme.primary,
        ),
      );
    }
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.onPrimary,
        side: BorderSide(color: colorScheme.onPrimary.withValues(alpha: 0.6)),
      ),
    );
  }
}
