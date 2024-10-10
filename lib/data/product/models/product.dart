// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:coffee_shop/domain/product/entity/product.dart';

class ProductModel {
  final String categoryId;
  final String image;
  final String title;
  final String type;
  final num price;
  final String raitings;
  final String description;
  final String productId;

  ProductModel({
    required this.categoryId,
    required this.image,
    required this.title,
    required this.type,
    required this.price,
    required this.raitings,
    required this.description,
    required this.productId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'image': image,
      'title': title,
      'type': type,
      'price': price,
      'raitings': raitings,
      'description': description,
      'productId': productId,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      categoryId: map['categoryId'] as String,
      image: map['image'] as String,
      title: map['title'] as String,
      type: map['type'] as String,
      price: map['price'] as num,
      raitings: map['raitings'] as String,
      description:  map['description'] as String,
      productId: map['productId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      categoryId: categoryId,
      image: image,
      title: title,
      type: type,
      price: price,
      raitings: raitings,
      description: description,
      productId: productId,
    );
  }
}
