import 'dart:convert';

import 'package:http/http.dart' as http;

class GetProducts {
  final String title;
  final String image;
  final String category;
  final String price;
  GetProducts(
      {required this.title,
      required this.image,
      required this.category,
      required this.price});

  factory GetProducts.fromJson(Map<String, dynamic> json) {
    return GetProducts(
        title: json["title"] as String,
        image: json["image"] as String,
        category: json["category"] as String,
        price: json["price"]?.toString() as String);
  }
  @override
  String toString() {
    return '{title: $title, image: $image, category: $category , }';
  }
}

final url = "https://fakestoreapi.com/products?limit=20";
Future<List<GetProducts>> GetProductsApi() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);

    List<GetProducts> products =
        body.map((dynamic item) => GetProducts.fromJson(item)).toList();

    return products;
  } else {
    throw Exception("Internal Server Error");
  }
}
