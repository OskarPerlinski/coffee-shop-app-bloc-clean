import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/data/order/model/order.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class OrderFirebaseService {
  Future<Either> addToCart(OrderModel orderModel);
  Future<Either> getCartProducts();
  Future<Either> removeCartProduct(String id);
}

class OrderFirebaseServiceImpl extends OrderFirebaseService {
  @override
  Future<Either> addToCart(OrderModel orderModel) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Cart')
          .add(
            orderModel.toMap(),
          );
      return const Right('Add to cart was successfully');
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getCartProducts() async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      var returnedData = await FirebaseFirestore.instance
          .collection(
            'Users',
          )
          .doc(user!.uid)
          .collection('Cart')
          .get();

      List<Map> products = [];
      for (var item in returnedData.docs) {
        var data = item.data();
        data.addAll({'id': item.id});
        products.add(data);
      }

      return Right(products);
    } catch (e) {
      return const Left(
        'Please try again',
      );
    }
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection(
            'Users',
          )
          .doc(user!.uid)
          .collection('Cart')
          .doc(id)
          .delete();
      return const Right('Product deleted successfully');
    } catch (e) {
      return const Left(
        'Please try again',
      );
    }
  }
}
