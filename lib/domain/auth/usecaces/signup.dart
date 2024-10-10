import 'package:coffee_shop/core/usecase/usecase.dart';
import 'package:coffee_shop/data/auth/models/user_creation_req.dart';
import 'package:coffee_shop/domain/auth/repository/auth.dart';
import 'package:coffee_shop/service_locator.dart';
import 'package:dartz/dartz.dart';

class SignupUseCase implements UseCase<Either, UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
