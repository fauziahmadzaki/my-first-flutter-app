class Product {
  final int id;
  final String name;
  final String? desc;
  final int price;
  final bool isLimited;

  Product({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.isLimited,
  });

  factory Product.fromJson(Map<String, dynamic> product) {
    return Product(
      id: product['id'] as int? ?? 0,
      name: product['name'] as String? ?? "",
      desc: product['desc'] as String?,
      price: product['price'] as int? ?? 0,
      isLimited: product['isLimited'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "desc": desc,
      "price": price,
      "isLimited": isLimited,
    };
  }
}