import 'package:coffee_shop/core/usecase/usecase.dart';
import 'package:coffee_shop/domain/order/repository/order.dart';
import 'package:coffee_shop/service_locator.dart';
import 'package:dartz/dartz.dart';
class RemoveCartProductUseCase implements UseCase<Either, String> {

  @override
  Future<Either> call({String ? params}) async {
    return sl<OrderRepository>().removeCartProduct(params!);
  }

}