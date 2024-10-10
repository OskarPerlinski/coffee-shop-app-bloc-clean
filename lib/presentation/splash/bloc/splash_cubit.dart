import 'package:bloc/bloc.dart';
import 'package:coffee_shop/presentation/splash/bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    emit(UnAuthenticated());
  }
}
