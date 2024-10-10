import 'package:coffee_shop/common/widgets/appbar/basic_appbar.dart';
import 'package:coffee_shop/domain/order/entity/product_ordered.dart';
import 'package:coffee_shop/presentation/cart/bloc/cart_product_display_cubit.dart';
import 'package:coffee_shop/presentation/cart/bloc/cart_product_display_state.dart';
import 'package:coffee_shop/presentation/cart/widgets/order_to_table.dart';
import 'package:coffee_shop/presentation/cart/widgets/product_ordered_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text(
          'Cart',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => CartProductDisplayCubit()..displayCartProducts(),
        child: BlocBuilder<CartProductDisplayCubit, CartProductDisplayState>(
          builder: (context, state) {
            if (state is CartProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartProductsLoaded) {
              return state.products.isEmpty
                  ? Center(child: _cartIsEmpty())
                  : Stack(
                      children: [
                        _products(state.products),
                        const Align(
                          alignment: Alignment.bottomCenter,
                          child: OrderToTable(),
                        ),
                      ],
                    );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _products(List<ProductOrderedModelEntity> products) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ProductOrderedCard(
          productOrdereModelEntity: products[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: products.length,
    );
  }

  Widget _cartIsEmpty() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Cart is empty',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
