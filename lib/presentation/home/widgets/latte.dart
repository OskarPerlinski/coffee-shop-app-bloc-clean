import 'package:coffee_shop/common/bloc/product/products_cubit.dart';
import 'package:coffee_shop/common/bloc/product/products_state.dart';
import 'package:coffee_shop/common/widgets/card/product_card.dart';
import 'package:coffee_shop/domain/product/entity/product.dart';
import 'package:coffee_shop/domain/product/usecases/latte.dart';
import 'package:coffee_shop/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Latte extends StatelessWidget {
  const Latte({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit(useCase: sl<LatteUseCase>())..displayProducts(),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _latte(),
                const SizedBox(height: 20),
                _products(state.products),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _latte() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Text(
          'LATTE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
            letterSpacing: 4,
          ),
        ),
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Expanded(
        child: SizedBox(
          height: 530,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                productEntity: products[index],
              );
            },
            itemCount: 4,
          ),
        ),
      ),
    );
  }
}
