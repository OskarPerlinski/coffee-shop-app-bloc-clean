import 'package:coffee_shop/core/usecase/usecase.dart';
import 'package:coffee_shop/domain/order/repository/order.dart';
import 'package:coffee_shop/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetCartProductsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return sl<OrderRepository>().getCartProducts();
  }

}