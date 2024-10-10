// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderModel {
  final String productId;
  final String productTitle;
  final String productPrice;

  OrderModel({
    required this.productId,
    required this.productTitle,
    required this.productPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productTitle': productTitle,
      'productPrice': productPrice,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      productId: map['productId'] as String,
      productTitle: map['productTitle'] as String,
      productPrice: map['productPrice'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
