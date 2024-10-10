import 'package:coffee_shop/core/usecase/usecase.dart';
import 'package:coffee_shop/data/auth/models/user_signin_req.dart';
import 'package:coffee_shop/data/auth/source/auth_firebase_service.dart';
import 'package:coffee_shop/service_locator.dart';
import 'package:dartz/dartz.dart';

class SigninUseCase implements UseCase<Either, UserSigninReq> {
  @override
  Future<Either> call({UserSigninReq ? params}) {
   return sl<AuthFirebaseService>().signin(params!);
  }

}