class Review {
  int id;
  String comment;
  double rating;
  String createdAt;
  int userId;

  Review({required this.id, required this.comment, required this.rating, required this.createdAt, required this.userId});

  factory Review.fromMap(Map<String, dynamic> json) => Review(
    id: json["id"],
    comment: json["comment"],
    rating: (json["rating"] ?? 0).toDouble(),
    createdAt: json["created_at"],
    userId: json["user_id"],
  );
}