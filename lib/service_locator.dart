import 'package:coffee_shop/data/auth/repository/auth_repository_impl.dart';
import 'package:coffee_shop/data/auth/source/auth_firebase_service.dart';
import 'package:coffee_shop/data/order/repository/order.dart';
import 'package:coffee_shop/data/order/source/order_firebase_service.dart';
import 'package:coffee_shop/data/product/repository/product.dart';
import 'package:coffee_shop/data/product/source/product_firebase_service.dart';
import 'package:coffee_shop/domain/auth/repository/auth.dart';
import 'package:coffee_shop/domain/auth/usecaces/send_password_reset_email.dart';
import 'package:coffee_shop/domain/auth/usecaces/signin.dart';
import 'package:coffee_shop/domain/auth/usecaces/signup.dart';
import 'package:coffee_shop/domain/order/repository/order.dart';
import 'package:coffee_shop/domain/order/usecases/get_cart_products.dart';
import 'package:coffee_shop/domain/order/usecases/order.dart';
import 'package:coffee_shop/domain/order/usecases/remove_cart_product.dart';
import 'package:coffee_shop/domain/product/repository/product.dart';
import 'package:coffee_shop/domain/product/usecases/cappuccino.dart';
import 'package:coffee_shop/domain/product/usecases/latte.dart';
import 'package:coffee_shop/domain/product/usecases/macchiato.dart';
import 'package:coffee_shop/domain/product/usecases/mocha.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Service
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  sl.registerSingleton<ProductFirebaseService>(
    ProductFirebaseServiceImpl(),
  );

  sl.registerSingleton<OrderFirebaseService>(
    OrderFirebaseServiceImpl(),
  );


  //Repositories
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  sl.registerSingleton<ProductRepository>(
    ProductRepositoryImpl(),
  );

  sl.registerSingleton<OrderRepository>(
    OrderRepositoryImpl(),
  );


  //UseCases
  sl.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );

  sl.registerSingleton<SendPasswordResetEmailUseCase>(
    SendPasswordResetEmailUseCase(),
  );

  sl.registerSingleton<CappuccinoUseCase>(
    CappuccinoUseCase(),
  );

  sl.registerSingleton<MacchiatoUseCase>(
    MacchiatoUseCase(),
  );

  sl.registerSingleton<LatteUseCase>(
    LatteUseCase(),
  );

  sl.registerSingleton<MochaUseCase>(
    MochaUseCase(),
  );

  sl.registerSingleton<OrderUseCase>(
    OrderUseCase(),
  );

  sl.registerSingleton<GetCartProductsUseCase>(
    GetCartProductsUseCase(),
  );

  sl.registerSingleton<RemoveCartProductUseCase>(
    RemoveCartProductUseCase(),
  );

}
