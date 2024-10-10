import 'package:coffee_shop/domain/product/entity/product.dart';

abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}
class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductEntity> products;
  ProductsLoaded({required this.products});
}

class LoadProductsFailure extends ProductsState {}