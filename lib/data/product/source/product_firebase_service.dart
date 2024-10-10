import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductFirebaseService {
  Future<Either> cappuccino();
  Future<Either> macchiato();
  Future<Either> latte();
  Future<Either> mocha();
}

class ProductFirebaseServiceImpl extends ProductFirebaseService {
  @override
  Future<Either> cappuccino() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('categoryId', isEqualTo: 'c7ptH5rRwIHwkAKIMlY0')
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left(
        'Please try again',
      );
    }
  }

  @override
  Future<Either> macchiato() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('categoryId', isEqualTo: "eyru5WUiWU0uqoRLqGec")
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left(
        'Please try again',
      );
    }
  }

  @override
  Future<Either> latte() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('categoryId', isEqualTo: "Ck7KGNemjI4mD4ksQ2Uj")
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left(
        'Please try again',
      );
    }
  }

  @override
  Future<Either> mocha() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('categoryId', isEqualTo: "0D45fYtpDX1VphQwy2VK")
          .get();
      return Right(
        returnedData.docs.map((e) => e.data()).toList(),
      );
    } catch (e) {
      return const Left(
        'Please try again',
      );
    }
  }
}
