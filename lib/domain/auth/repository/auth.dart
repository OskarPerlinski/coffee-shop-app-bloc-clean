import 'package:coffee_shop/data/auth/models/user_creation_req.dart';
import 'package:coffee_shop/data/auth/models/user_signin_req.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(UserSigninReq user);
  Future<Either> sendPasswordResetEmail(String email);
}
