class Product {
  int? id;
  String? imageUrl;
  String? name;
  String? description;
  String? price;

  Product({
    this.id,
    this.imageUrl,
    this.name,
    this.description,
    this.price,
  });

  Product copyWith({
    int? id,
    String? imageUrl,
    String? name,
    String? description,
    String? price,
  }) =>
      Product(
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    imageUrl: json["image_url"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_url": imageUrl,
    "name": name,
    "description": description,
    "price": price,
  };
}
