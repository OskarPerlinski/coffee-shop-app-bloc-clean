import 'package:coffee_shop/data/order/model/order.dart';
import 'package:coffee_shop/data/order/model/product_ordered.dart';
import 'package:coffee_shop/data/order/source/order_firebase_service.dart';
import 'package:coffee_shop/domain/order/repository/order.dart';
import 'package:coffee_shop/service_locator.dart';
import 'package:dartz/dartz.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<Either> addToCart(OrderModel orderModel) {
    return sl<OrderFirebaseService>().addToCart(orderModel);
  }

  @override
  Future<Either> getCartProducts() async {
    var returnedData = await sl<OrderFirebaseService>().getCartProducts();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => ProductOrderedModel.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    var returnedData = await sl<OrderFirebaseService>().removeCartProduct(id);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (message) {
        return Right(message);
      },
    );
  }
}
