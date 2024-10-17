class Ingredient {
  int id;
  String name;
  String imgUrl;
  double quantity;
  String unit;

  Ingredient({required this.id, required this.name, required this.imgUrl, required this.quantity, required this.unit});

  factory Ingredient.fromMap(Map<String, dynamic> json) => Ingredient(
    id: json["id"],
    name: json["name"],
    imgUrl: "https://images.pexels.com/photos/5514818/pexels-photo-5514818.jpeg",//json["img_url"],
    quantity: (json["quantity"] ?? 0).toDouble(),
    unit: json["unit"],
  );
}