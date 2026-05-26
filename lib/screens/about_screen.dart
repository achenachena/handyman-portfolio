import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../widgets/stat_chip.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      children: [
        // Avatar / icon area
        Center(
          child: CircleAvatar(
            radius: 48,
            backgroundColor: theme.colorScheme.primaryContainer,
            child: Icon(
              Icons.person,
              size: 48,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            kHandymanName,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Text(
            kHandymanTagline,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Stats
        Row(
          children: [
            Expanded(
              child: StatChip(
                value: '$kYearsExperience',
                label: 'Years',
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
                label: 'Repeat',
                icon: Icons.people,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Bio
        Text(
          'About Me',
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(kHandymanBio, style: theme.textTheme.bodyLarge),
        const SizedBox(height: 24),

        // Certifications
        Text(
          'Certifications & Training',
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _CertTile(icon: Icons.verified, text: 'Licensed Residential Plumber'),
        _CertTile(icon: Icons.verified, text: 'Certified Electrician – Level 1'),
        _CertTile(icon: Icons.verified, text: 'WSIB Insured'),
        _CertTile(icon: Icons.verified, text: 'Fall Protection & WHMIS Trained'),
        const SizedBox(height: 24),

        // Service area
        Text(
          'Service Area',
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.location_on, color: theme.colorScheme.primary),
            const SizedBox(width: 8),
            Expanded(child: Text(kServiceArea, style: theme.textTheme.bodyLarge)),
          ],
        ),
      ],
    );
  }
}

class _CertTile extends StatelessWidget {
  const _CertTile({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: theme.colorScheme.primary),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: theme.textTheme.bodyLarge)),
        ],
      ),
    );
  }
}
