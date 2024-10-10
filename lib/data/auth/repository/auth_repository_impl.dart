import 'package:coffee_shop/data/auth/models/user_creation_req.dart';
import 'package:coffee_shop/data/auth/models/user_signin_req.dart';
import 'package:coffee_shop/data/auth/source/auth_firebase_service.dart';
import 'package:coffee_shop/domain/auth/repository/auth.dart';
import 'package:coffee_shop/service_locator.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserCreationReq user) {
    return sl<AuthFirebaseService>().signup(user);
  }

  @override
  Future<Either> signin(UserSigninReq user) {
    return sl<AuthFirebaseService>().signin(user);
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) {
    return sl<AuthFirebaseService>().sendPasswordResetEmail(email);
  }
}
