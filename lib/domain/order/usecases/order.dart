import 'package:coffee_shop/core/usecase/usecase.dart';
import 'package:coffee_shop/data/order/model/order.dart';
import 'package:coffee_shop/domain/order/repository/order.dart';
import 'package:coffee_shop/service_locator.dart';
import 'package:dartz/dartz.dart';

class OrderUseCase implements UseCase<Either, OrderModel> {
  @override
  Future<Either> call({OrderModel ? params}) {
    return sl<OrderRepository>().addToCart(params!);
  }

}