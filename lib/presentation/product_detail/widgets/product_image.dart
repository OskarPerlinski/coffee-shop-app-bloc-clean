import 'package:coffee_shop/common/helper/images/image_display_helper.dart';
import 'package:coffee_shop/domain/product/entity/product.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductImage({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 20,
      ),
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              ImageDisplayHelper.generateProductImageURL(
                productEntity.image,
              ),
            ),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
