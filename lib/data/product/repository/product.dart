import 'package:coffee_shop/data/product/models/product.dart';
import 'package:coffee_shop/data/product/source/product_firebase_service.dart';
import 'package:coffee_shop/domain/product/repository/product.dart';
import 'package:coffee_shop/service_locator.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either> cappuccino() async {
    var returnedData = await sl<ProductFirebaseService>().cappuccino();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(List.from(data)
            .map((e) => ProductModel.fromMap(e).toEntity())
            .toList());
      },
    );
  }

  @override
  Future<Either> macchiato() async {
    var returnedData = await sl<ProductFirebaseService>().macchiato();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => ProductModel.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }

  @override
  Future<Either> latte() async {
    var returnedData = await sl<ProductFirebaseService>().latte();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => ProductModel.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }

  @override
  Future<Either> mocha() async {
    var returnedData = await sl<ProductFirebaseService>().mocha();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => ProductModel.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }
}
