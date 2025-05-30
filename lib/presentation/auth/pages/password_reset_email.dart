import 'package:ecommerce/common/helper/navigator/app_navigator.dart';

import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/core/configs/assets/app_vectors.dart';
import 'package:ecommerce/presentation/auth/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordResetEmailPage extends StatelessWidget {
  const PasswordResetEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _emailSeding(),
          const SizedBox(height: 30),
          _sendEmail(),
          const SizedBox(height: 30),
          _returnToLoginButton(context),
        ],
      ),
    );
  }

  Widget _emailSeding() {
    return Center(
      child: SvgPicture.asset(AppVectors.emailSending),
    );
  }

  Widget _sendEmail() {
    return const Center(
      child: Text("We send you an Email to reset your password"),
    );
  }

  Widget _returnToLoginButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.pushReplacement(context, SigninPage());
      },
      width: 200,
      title: "Return to Login",
    );
  }
}
