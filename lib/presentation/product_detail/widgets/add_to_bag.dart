import 'package:coffee_shop/common/bloc/button/button_cubit.dart';
import 'package:coffee_shop/common/bloc/button/button_state.dart';
import 'package:coffee_shop/common/helper/navigator/app_navigator.dart';
import 'package:coffee_shop/common/widgets/button/basic_reactive_button.dart';
import 'package:coffee_shop/data/order/model/order.dart';
import 'package:coffee_shop/domain/order/usecases/order.dart';
import 'package:coffee_shop/domain/product/entity/product.dart';
import 'package:coffee_shop/presentation/cart/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity productEntity;
  const AddToBag({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonStateCubit, ButtonState>(
      listener: (context, state) {
        if (state is ButtonSuccessState) {
          AppNavigator.push(
            context,
            const CartPage(),
          );
        }
        if (state is ButtonFailureState) {
          var snackbar = SnackBar(
            content: Text(state.errorMessage),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: BasicReactiveButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                  usecase: OrderUseCase(),
                  params: OrderModel(
                    productId: productEntity.productId,
                    productTitle: productEntity.title,
                    productPrice: productEntity.price.toString(),
                  ),
                );
          },
          title: 'ADD TO BAG',
        ),
      ),
    );
  }
}
