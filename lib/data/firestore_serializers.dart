import 'package:flutter/material.dart';

import '../models/project.dart';
import '../models/review.dart';
import '../models/service.dart';

/// Material icons in this app use the MaterialIcons font.
IconData _iconFromMap(Map<String, dynamic> m) {
  final cp = m['iconCodePoint'] as int;
  return IconData(cp, fontFamily: 'MaterialIcons');
}

Map<String, dynamic> serviceToMap(Service s) => {
      'id': s.id,
      'title': s.title,
      'description': s.description,
      'iconCodePoint': s.icon.codePoint,
      'colorValue': s.color.toARGB32(),
    };

Service serviceFromMap(Map<String, dynamic> m) {
  return Service(
    id: m['id'] as String,
    title: m['title'] as String,
    description: m['description'] as String,
    icon: _iconFromMap(m),
    color: Color(m['colorValue'] as int),
  );
}

Map<String, dynamic> projectToMap(Project p) => {
      'id': p.id,
      'title': p.title,
      'category': p.category,
      'description': p.description,
      'placeholderColor': p.placeholderColor.toARGB32(),
      if (p.imageUrl != null) 'imageUrl': p.imageUrl,
      if (p.beforeLabel != null) 'beforeLabel': p.beforeLabel,
      if (p.afterLabel != null) 'afterLabel': p.afterLabel,
    };

Project projectFromMap(Map<String, dynamic> m) {
  return Project(
    id: m['id'] as String,
    title: m['title'] as String,
    category: m['category'] as String,
    description: m['description'] as String,
    placeholderColor: Color(m['placeholderColor'] as int),
    imageUrl: m['imageUrl'] as String?,
    beforeLabel: m['beforeLabel'] as String?,
    afterLabel: m['afterLabel'] as String?,
  );
}

Map<String, dynamic> reviewToMap(Review r) => {
      'id': r.id,
      'name': r.name,
      'rating': r.rating,
      'comment': r.comment,
      'date': r.date,
    };

Review reviewFromMap(Map<String, dynamic> m) {
  return Review(
    id: m['id'] as String,
    name: m['name'] as String,
    rating: (m['rating'] as num).toDouble(),
    comment: m['comment'] as String,
    date: m['date'] as String,
  );
}
