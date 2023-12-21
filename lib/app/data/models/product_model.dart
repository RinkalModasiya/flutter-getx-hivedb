import 'dart:convert';

import 'package:hive/hive.dart';

part 'product_model.g.dart'; // Generated part file

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class ProductModel extends HiveObject {
  @HiveField(0)
  List<Product> products;

  @HiveField(1)
  int total;

  @HiveField(2)
  int skip;

  @HiveField(3)
  int limit;

  ProductModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

@HiveType(typeId: 2)
class Product extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? description;

  @HiveField(3)
  int? price;

  @HiveField(4)
  double? discountPercentage;

  @HiveField(5)
  double? rating;

  @HiveField(6)
  int? stock;

  @HiveField(7)
  String? brand;

  @HiveField(8)
  String? category;

  @HiveField(9)
  String? thumbnail;

  @HiveField(10)
  List<String>? images;

  @HiveField(11)
  DateTime? lastUpdatedAt;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
    this.lastUpdatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
        lastUpdatedAt: json["lastUpdatedAt"] != null
            ? DateTime.parse(json["lastUpdatedAt"])
            : json["lastUpdatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "lastUpdatedAt": lastUpdatedAt?.toIso8601String(),
      };
}
