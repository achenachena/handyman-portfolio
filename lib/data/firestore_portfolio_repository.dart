import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/project.dart';
import '../models/review.dart';
import '../models/service.dart';
import 'firestore_serializers.dart';
import 'portfolio_repository.dart';

class FirestorePortfolioRepository implements PortfolioRepository {
  FirestorePortfolioRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  @override
  Future<List<Service>> getServices() async {
    final snap = await _db.collection('services').orderBy(FieldPath.documentId).get();
    return snap.docs.map((d) => serviceFromMap(d.data())).toList();
  }

  @override
  Future<List<Project>> getProjects() async {
    final snap = await _db.collection('projects').orderBy(FieldPath.documentId).get();
    return snap.docs.map((d) => projectFromMap(d.data())).toList();
  }

  @override
  Future<List<Review>> getReviews() async {
    final snap = await _db.collection('reviews').orderBy(FieldPath.documentId).get();
    return snap.docs.map((d) => reviewFromMap(d.data())).toList();
  }

  @override
  Future<void> submitContact({
    required String name,
    required String email,
    required String message,
  }) async {
    await _db.collection('contact_messages').add({
      'name': name,
      'email': email,
      'message': message,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
