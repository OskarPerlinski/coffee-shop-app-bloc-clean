import 'package:coffee_shop/presentation/cart/bloc/cart_product_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/order/entity/product_ordered.dart';

class ProductOrderedCard extends StatelessWidget {
  final ProductOrderedModelEntity productOrdereModelEntity;
  const ProductOrderedCard({
    super.key,
    required this.productOrdereModelEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 30,
        right: 30,
      ),
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 4,
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productOrdereModelEntity.productTitle,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "${productOrdereModelEntity.productPrice} \$",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CartProductDisplayCubit>()
                                .removeProduct(productOrdereModelEntity);
                          },
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<CartProductDisplayCubit>()
                                  .removeProduct(
                                    productOrdereModelEntity,
                                  );
                            },
                            child: Center(
                              child: Container(
                                height: 23,
                                width: 23,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
