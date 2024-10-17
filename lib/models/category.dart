class Category {
  int id;
  String name;
  String imgUrl;

  Category({required this.id, required this.name, required this.imgUrl});

  factory Category.fromMap(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    imgUrl: "https://cdn.pixabay.com/photo/2016/08/20/05/51/avatar-1606939_960_720.png"//json["img_url"],
  );
}