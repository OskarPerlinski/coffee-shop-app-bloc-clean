import 'package:coffee_shop/common/bloc/product/products_state.dart';
import 'package:coffee_shop/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductsCubit extends Cubit<ProductsState> {
  final UseCase useCase;
  ProductsCubit({required this.useCase}) : super(ProductsInitialState());
  
  void displayProducts({dynamic params}) async {
    emit(
      ProductsLoading()
    );
    var returnedData = await useCase.call(
      params: params
    );
    returnedData.fold(
      (error) {
        emit(
          LoadProductsFailure()
        );
      },
      (data) {
        emit(
          ProductsLoaded(products: data)
        );
      }
    );
  }

  void displayInitial() {
    emit(
      ProductsInitialState()
    );
  }

}