import 'package:coffee_shop/common/helper/images/image_display_helper.dart';
import 'package:coffee_shop/common/helper/navigator/app_navigator.dart';
import 'package:coffee_shop/domain/product/entity/product.dart';
import 'package:coffee_shop/presentation/product_detail/page/product_detail.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductCard({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
          context,
           ProductDetailPage(productEntity: productEntity),
        );
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 4,
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        ImageDisplayHelper.generateProductImageURL(
                          productEntity.image,
                        ),
                      ),
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productEntity.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                      Text(
                        productEntity.type,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${productEntity.price}\$",
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 30,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
