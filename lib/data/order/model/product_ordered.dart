// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:coffee_shop/domain/order/entity/product_ordered.dart';

class ProductOrderedModel {
  final String productId;
  final String productTitle;
  final String productPrice;
  final String id;

  ProductOrderedModel({
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.id,
  });

  factory ProductOrderedModel.fromMap(Map<String, dynamic> map) {
    return ProductOrderedModel(
      productId: map['productId'] as String,
      productTitle: map['productTitle'] as String,
      productPrice: map['productPrice'] as String,
      id: map['id'] as String,
    );
  }
}

extension ProductOrderedXModel on ProductOrderedModel {
  ProductOrderedModelEntity toEntity() {
    return ProductOrderedModelEntity(
      productId: productId,
      productTitle: productTitle,
      productPrice: productPrice,
      id: id,
    );
  }
}
