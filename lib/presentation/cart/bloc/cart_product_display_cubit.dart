import 'package:coffee_shop/domain/order/entity/product_ordered.dart';
import 'package:coffee_shop/domain/order/usecases/get_cart_products.dart';
import 'package:coffee_shop/domain/order/usecases/remove_cart_product.dart';
import 'package:coffee_shop/presentation/cart/bloc/cart_product_display_state.dart';
import 'package:coffee_shop/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductDisplayCubit extends Cubit<CartProductDisplayState> {
  CartProductDisplayCubit() : super(CartProductsLoading());

  void displayCartProducts() async {
    var returnedData = await sl<GetCartProductsUseCase>().call();
    returnedData.fold(
      (error) {
        emit(
          LoadProductsFailure(),
        );
      },
      (data) {
        emit(
          CartProductsLoaded(products: data),
        );
      },
    );
  }

  void removeProduct(ProductOrderedModelEntity product) async {
    emit(CartProductsLoading());
     var returnedData = await sl<RemoveCartProductUseCase>().call(
      params: product.id,
     );
    returnedData.fold(
      (error) {
        emit(
          LoadProductsFailure(),
        );
      },
      (data) {
        displayCartProducts();
      },
    );
  }

}
