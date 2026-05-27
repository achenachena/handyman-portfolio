import 'package:cloud_firestore/cloud_firestore.dart';

import 'firestore_serializers.dart';
import 'mock_data.dart';

/// Writes [kServices], [kProjects], and [kReviews] into Firestore when
/// collections are empty (first launch after creating the Firebase project).
class FirestoreSeeder {
  FirestoreSeeder._();

  static Future<void> seedIfEmpty(FirebaseFirestore db) async {
    final servicesSnap = await db.collection('services').limit(1).get();
    if (servicesSnap.docs.isEmpty) {
      final batch = db.batch();
      for (final s in kServices) {
        batch.set(db.collection('services').doc(s.id), serviceToMap(s));
      }
      for (final p in kProjects) {
        batch.set(db.collection('projects').doc(p.id), projectToMap(p));
      }
      for (final r in kReviews) {
        batch.set(db.collection('reviews').doc(r.id), reviewToMap(r));
      }
      await batch.commit();
    }
  }
}
