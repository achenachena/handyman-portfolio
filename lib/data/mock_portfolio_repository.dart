import '../models/project.dart';
import '../models/review.dart';
import '../models/service.dart';
import 'mock_data.dart';
import 'portfolio_repository.dart';

class MockPortfolioRepository implements PortfolioRepository {
  @override
  Future<List<Service>> getServices() async => kServices;

  @override
  Future<List<Project>> getProjects() async => kProjects;

  @override
  Future<List<Review>> getReviews() async => kReviews;

  @override
  Future<void> submitContact({
    required String name,
    required String email,
    required String message,
  }) async {
    // In a real app this would write to Firestore.
    await Future<void>.delayed(const Duration(milliseconds: 400));
  }
}
