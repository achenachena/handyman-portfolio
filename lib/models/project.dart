import 'package:flutter/material.dart';

class Project {
  const Project({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.placeholderColor,
    this.imageUrl,
    this.beforeLabel,
    this.afterLabel,
  });

  final String id;
  final String title;
  final String category;
  final String description;
  final Color placeholderColor;
  /// Optional HTTPS image for the card header (Unsplash CDN in [kProjects]).
  final String? imageUrl;
  final String? beforeLabel;
  final String? afterLabel;
}
