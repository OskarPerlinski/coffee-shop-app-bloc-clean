import 'package:coffee_shop/domain/product/entity/product.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDescription({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _descritpion(context),
      ],
    );
  }

  Widget _descritpion(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            productEntity.description,
          ),
        ],
      ),
    );
  }
}
