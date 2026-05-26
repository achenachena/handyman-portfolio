class Review {
  const Review({
    required this.id,
    required this.name,
    required this.rating,
    required this.comment,
    required this.date,
  });

  final String id;
  final String name;
  final double rating;
  final String comment;
  final String date;
}
