import 'package:coffee_shop/data/order/model/order.dart';
import 'package:dartz/dartz.dart';

abstract class OrderRepository{
  Future<Either> addToCart(OrderModel orderModel);
  Future<Either> getCartProducts();
  Future<Either> removeCartProduct(String id);
}