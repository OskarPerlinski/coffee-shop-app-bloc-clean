import 'package:coffee_shop/common/bloc/button/button_state.dart';
import 'package:coffee_shop/common/bloc/button/button_cubit.dart';
import 'package:coffee_shop/common/helper/navigator/app_navigator.dart';
import 'package:coffee_shop/common/widgets/appbar/basic_appbar.dart';
import 'package:coffee_shop/common/widgets/button/basic_reactive_button.dart';
import 'package:coffee_shop/data/auth/models/user_signin_req.dart';
import 'package:coffee_shop/domain/auth/usecaces/signin.dart';
import 'package:coffee_shop/presentation/auth/pages/reset_password.dart';
import 'package:coffee_shop/presentation/auth/pages/sign_up.dart';
import 'package:coffee_shop/presentation/home/page/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatelessWidget {
  final UserSigninReq signinReq;
  SigninPage({super.key, required this.signinReq});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: true),
      backgroundColor: Colors.brown,
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState) {
                var snackbar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
              if (state is ButtonSuccessState) {
                AppNavigator.pushAndRemove(
                  context,
                  const HomePage(),
                );
              }
            },
            child: Column(
              children: [
                _signinText(context),
                const SizedBox(height: 50),
                _emailField(context),
                const SizedBox(height: 10),
                _passwordField(context),
                const SizedBox(height: 20),
                _continueButton(),
                const SizedBox(height: 30),
                _createAccount(context),
                const SizedBox(height: 30),
                _resetPassword(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return const Center(
      child: Text(
        'Sign In',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextField(
        controller: _emailCon,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.mail_outline,
            color: Colors.black38,
          ),
          fillColor: Colors.greenAccent,
          filled: true,
          labelText: 'email',
          labelStyle: TextStyle(
            color: Colors.black38,
          ),
        ),
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextField(
        controller: _passwordCon,
        obscureText: true,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.password_outlined,
            color: Colors.black38,
          ),
          fillColor: Colors.greenAccent,
          filled: true,
          labelText: 'password',
          labelStyle: TextStyle(
            color: Colors.black38,
          ),
        ),
      ),
    );
  }

  Widget _continueButton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Builder(builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            signinReq.email = _emailCon.text;
            signinReq.password = _passwordCon.text;
            context.read<ButtonStateCubit>().execute(
                  usecase: SigninUseCase(),
                  params: signinReq,
                );
          },
          title: 'Login',
        );
      }),
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Dont have an account?  ',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: '  Create Account',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(
                  context,
                  SignUpPage(),
                );
              },
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  Widget _resetPassword(BuildContext context) {
    return TextButton(
      onPressed: () {
        AppNavigator.push(
          context,
          ResetPasswordPage(),
        );
      },
      child: const Text(
        'Forgot Password?',
        style: TextStyle(
          color: Colors.greenAccent,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
