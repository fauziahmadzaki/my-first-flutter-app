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

void main() {
  final productData = {
    "id": 1,
    "name": "Product with full property",
    "desc": "Product Desc",
    "price": 15000,
    "isLimited": true,
  };

  final productWithMissingData = {
    "id": 2,
    "name": "Product with missing some property",
  };

  final listOfProducts = [
    Product.fromJson(productData),
    Product.fromJson(productWithMissingData),
  ];

  print("List of Product");
  listOfProducts.asMap().forEach((idx, p) {
    print('Product ${idx + 1}');
    print('ID : ${p.id}');
    print('Name : ${p.name}');
    print('Description : ${p.desc}');
    print('Price : ${p.price}');
    print('Limited : ${p.isLimited ? "Yes" : "No"}');
    print('----------------------------------');
    print('toJson serialization result :');
    print('Product ${idx + 1} toJson : ${p.toJson()}');
  });
}
