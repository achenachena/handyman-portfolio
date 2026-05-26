import '../models/project.dart';
import '../models/review.dart';
import '../models/service.dart';

abstract class PortfolioRepository {
  Future<List<Service>> getServices();
  Future<List<Project>> getProjects();
  Future<List<Review>> getReviews();
  Future<void> submitContact({
    required String name,
    required String email,
    required String message,
  });
}
