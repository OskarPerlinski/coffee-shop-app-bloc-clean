import 'package:coffee_shop/core/usecase/usecase.dart';
import 'package:coffee_shop/domain/product/repository/product.dart';
import 'package:coffee_shop/service_locator.dart';
import 'package:dartz/dartz.dart';

class LatteUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<ProductRepository>().latte();
  }
}
