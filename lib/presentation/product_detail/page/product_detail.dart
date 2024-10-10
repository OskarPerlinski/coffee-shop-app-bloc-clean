import 'package:coffee_shop/common/bloc/button/button_cubit.dart';
import 'package:coffee_shop/common/widgets/appbar/basic_appbar.dart';
import 'package:coffee_shop/domain/product/entity/product.dart';
import 'package:coffee_shop/presentation/product_detail/widgets/add_to_bag.dart';
import 'package:coffee_shop/presentation/product_detail/widgets/product_description.dart';
import 'package:coffee_shop/presentation/product_detail/widgets/product_image.dart';
import 'package:coffee_shop/presentation/product_detail/widgets/product_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailPage({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonStateCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const BasicAppbar(
          title: Text(
            'Detail',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                ProductImage(productEntity: productEntity),
                const SizedBox(height: 20),
                ProductInfo(productEntity: productEntity),
                const SizedBox(height: 20),
                ProductDescription(productEntity: productEntity),
                const SizedBox(height: 50),
                 AddToBag(productEntity: productEntity),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
