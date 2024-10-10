import 'package:coffee_shop/domain/order/entity/product_ordered.dart';

abstract class CartProductDisplayState {}

class CartProductsLoading extends CartProductDisplayState{}

class CartProductsLoaded extends CartProductDisplayState{
  final List<ProductOrderedModelEntity> products;
  CartProductsLoaded({required this.products});
}

class LoadProductsFailure extends CartProductDisplayState{}