import 'package:coffee_shop/domain/product/entity/product.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductInfo({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _coffeeInfo(context),
        const SizedBox(height: 20),
        _raitings(context),
        const SizedBox(height: 20),
        _dividerDecoration(),
      ],
    );
  }

  Widget _coffeeInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productEntity.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                productEntity.type,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Column(
            children: [
              const Text(
                'Price',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                "${productEntity.price}\$",
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _raitings(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.orange,
          ),
          const SizedBox(width: 5),
          Text(
            productEntity.raitings,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),
          const Text(
            '(230)',
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget _dividerDecoration() {
    return const Padding(
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Divider(),
    );
  }
}
