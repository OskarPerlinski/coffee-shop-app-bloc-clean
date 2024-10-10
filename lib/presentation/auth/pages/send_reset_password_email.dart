import 'package:coffee_shop/common/helper/navigator/app_navigator.dart';
import 'package:coffee_shop/common/widgets/appbar/basic_appbar.dart';
import 'package:coffee_shop/common/widgets/button/basic_button.dart';
import 'package:coffee_shop/core/configs/assets/app_vectors.dart';
import 'package:coffee_shop/data/auth/models/user_signin_req.dart';
import 'package:coffee_shop/presentation/auth/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SendResetPasswordEmailPage extends StatelessWidget {
  SendResetPasswordEmailPage({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      backgroundColor: Colors.brown,
      body: Column(
        children: [
          _logo(),
          const SizedBox(height: 20),
          _textEmailSend(context),
          const SizedBox(height: 50),
          _returnLogin(context),
        ],
      ),
    );
  }

  Widget _logo() {
    return SvgPicture.asset(AppVectors.emailSending);
  }

  Widget _textEmailSend(BuildContext context) {
    return const Center(
      child: Text(
        'We Sent you an Email to reset your password.',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _returnLogin(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.pushAndRemove(
          context,
          SigninPage(
            signinReq: UserSigninReq(
              email: _emailCon.text,
              password: _passwordCon.text,
            ),
          ),
        );
      },
      width: 200,
      title: 'Return to Login',
    );
  }
}
