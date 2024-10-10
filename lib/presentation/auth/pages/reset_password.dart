import 'package:coffee_shop/common/bloc/button/button_state.dart';
import 'package:coffee_shop/common/bloc/button/button_cubit.dart';
import 'package:coffee_shop/common/helper/navigator/app_navigator.dart';
import 'package:coffee_shop/common/widgets/appbar/basic_appbar.dart';
import 'package:coffee_shop/common/widgets/button/basic_reactive_button.dart';
import 'package:coffee_shop/domain/auth/usecaces/send_password_reset_email.dart';
import 'package:coffee_shop/presentation/auth/pages/send_reset_password_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key});

  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
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
                AppNavigator.push(
                  context,
                  SendResetPasswordEmailPage(),
                );
              }
            },
            child: Column(
              children: [
                _resetPasswordText(context),
                const SizedBox(height: 50),
                _emailField(context),
                const SizedBox(height: 20),
                _continueButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _resetPasswordText(BuildContext context) {
    return const Center(
      child: Text(
        'Reset Password',
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
                usecase: SendPasswordResetEmailUseCase(),
                params: _emailCon.text);
          },
          title: 'Send Email',
        );
      }),
    );
  }
}
