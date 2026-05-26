import 'package:flutter/material.dart';

import '../models/project.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder image area
          Container(
            height: 140,
            width: double.infinity,
            color: project.placeholderColor.withValues(alpha: 0.15),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.image_outlined,
                    size: 48,
                    color: project.placeholderColor.withValues(alpha: 0.4),
                  ),
                ),
                if (project.beforeLabel != null && project.afterLabel != null)
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Row(
                      children: [
                        _BeforeAfterTag(label: 'Before: ${project.beforeLabel!}'),
                        const SizedBox(width: 6),
                        _BeforeAfterTag(label: 'After: ${project.afterLabel!}'),
                      ],
                    ),
                  ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: project.placeholderColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      project.category,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  project.description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BeforeAfterTag extends StatelessWidget {
  const _BeforeAfterTag({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Colors.white,
            fontSize: 10,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
