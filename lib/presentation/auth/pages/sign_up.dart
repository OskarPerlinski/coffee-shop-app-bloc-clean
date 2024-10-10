import 'package:coffee_shop/common/bloc/button/button_state.dart';
import 'package:coffee_shop/common/bloc/button/button_cubit.dart';
import 'package:coffee_shop/common/helper/navigator/app_navigator.dart';
import 'package:coffee_shop/common/widgets/appbar/basic_appbar.dart';
import 'package:coffee_shop/common/widgets/button/basic_reactive_button.dart';
import 'package:coffee_shop/data/auth/models/user_creation_req.dart';
import 'package:coffee_shop/data/auth/models/user_signin_req.dart';
import 'package:coffee_shop/domain/auth/usecaces/signup.dart';
import 'package:coffee_shop/presentation/auth/pages/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _userNameCon = TextEditingController();
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
            },
            child: Column(
              children: [
                _signupText(context),
                const SizedBox(height: 50),
                _usernameField(context),
                const SizedBox(height: 10),
                _emailField(context),
                const SizedBox(height: 10),
                _passwordField(context),
                const SizedBox(height: 20),
                _continueButton(),
                const SizedBox(height: 30),
                _loginAccount(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return const Center(
      child: Text(
        'Sign Up',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _usernameField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextField(
        controller: _userNameCon,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.people,
            color: Colors.black38,
          ),
          fillColor: Colors.greenAccent,
          filled: true,
          labelText: 'username',
          labelStyle: TextStyle(
            color: Colors.black38,
          ),
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
            context.read<ButtonStateCubit>().execute(
                  usecase: SignupUseCase(),
                  params: UserCreationReq(
                    username: _userNameCon.text,
                    email: _emailCon.text,
                    password: _passwordCon.text,
                  ),
                );
          },
          title: 'Create Account',
        );
      }),
    );
  }

  Widget _loginAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Already have an account?  ',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: '  Login',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(
                  context,
                  SigninPage(
                    signinReq: UserSigninReq(
                      email: _emailCon.text,
                      password: _passwordCon.text,
                    ),
                  ),
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
}
