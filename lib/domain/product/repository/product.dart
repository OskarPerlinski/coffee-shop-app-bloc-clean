import 'package:dartz/dartz.dart';

abstract class ProductRepository {

  Future<Either> cappuccino();
  Future<Either> macchiato();
  Future<Either> latte();
  Future<Either> mocha();
}