class Creator {
  int id;
  String name;
  String imgUrl;
  String bio;
  int recipeCount;
  int totalReviews;
  double avgRating;
  int followers;
  int following;

  Creator({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.bio,
    required this.recipeCount,
    required this.totalReviews,
    required this.avgRating,
    required this.followers,
    required this.following,
  });

  factory Creator.fromMap(Map<String, dynamic> json) => Creator(
    id: json["id"],
    name: json["name"],
    imgUrl: "https://cdn.pixabay.com/photo/2016/08/20/05/51/avatar-1606939_960_720.png",//json["img_url"],
    bio: json["bio"],
    recipeCount: json["recipe_count"],
    totalReviews: json["total_reviews"],
    avgRating: json["avg_rating"],
    followers: json["followers"],
    following: json["following"],
  );
}