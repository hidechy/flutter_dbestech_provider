// ignore_for_file: inference_failure_on_untyped_parameter, avoid_dynamic_calls

import 'dart:convert';

List<Sneaker> sneakersFromJson(String str) {
  final decodedStr = json.decode(str) as List<dynamic>;

  final list = <Sneaker>[];
  for (var i = 0; i < decodedStr.length; i++) {
    final val = Sneaker.fromJson(decodedStr[i] as Map<String, dynamic>);
    list.add(val);
  }

  return list;
}

class Sneaker {
  Sneaker({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.oldPrice,
    required this.sizes,
    required this.price,
    required this.description,
    required this.title,
  });

  factory Sneaker.fromJson(Map<String, dynamic> json) => Sneaker(
        id: json['id'],
        name: json['name'],
        category: json['category'],
        imageUrl: List<String>.from(json['imageUrl'].map((x) => x)),
        oldPrice: json['oldPrice'],
        sizes: List<dynamic>.from(json['sizes'].map((x) => x)),
        price: json['price'],
        description: json['description'],
        title: json['title'],
      );

  final String id;
  final String name;
  final String category;
  final List<String> imageUrl;
  final String oldPrice;
  final List<dynamic> sizes;
  final String price;
  final String description;
  final String title;
}
