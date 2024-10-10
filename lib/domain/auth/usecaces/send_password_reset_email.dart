import 'package:coffee_shop/core/usecase/usecase.dart';
import 'package:coffee_shop/data/auth/source/auth_firebase_service.dart';
import 'package:coffee_shop/service_locator.dart';
import 'package:dartz/dartz.dart';

class SendPasswordResetEmailUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return sl<AuthFirebaseService>().sendPasswordResetEmail(params!);
  }
}
