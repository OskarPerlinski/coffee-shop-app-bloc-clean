import 'package:coffee_shop/common/helper/navigator/app_navigator.dart';
import 'package:coffee_shop/core/configs/assets/app_vectors.dart';
import 'package:coffee_shop/data/auth/models/user_signin_req.dart';
import 'package:coffee_shop/presentation/auth/pages/sign_in.dart';
import 'package:coffee_shop/presentation/home/page/home.dart';
import 'package:coffee_shop/presentation/splash/bloc/splash_cubit.dart';
import 'package:coffee_shop/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
        child: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is UnAuthenticated) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SigninPage(
                    signinReq: UserSigninReq(
                      email: _emailCon.text,
                      password: _passwordCon.text,
                    ),
                  ),
                ),
              );
              if (state is Authenticated) {
                AppNavigator.pushAndRemove(
                  context,
                  const HomePage(),
                );
              }
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _appLogo(),
              const SizedBox(height: 20),
              _nameApp(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appLogo() {
    return SvgPicture.asset(
      AppVectors.appLogo,
      height: 150,
    );
  }

  Widget _nameApp() {
    return const Text(
      'Kopi Kap',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.white,
      ),
    );
  }
}
