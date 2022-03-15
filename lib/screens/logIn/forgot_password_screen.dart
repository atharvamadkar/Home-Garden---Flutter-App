import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_garden/constants/app_colors.dart';
import 'package:home_garden/screens/logIn/sign_in_screen.dart';
import 'package:home_garden/services/auth/bloc/auth_event.dart';
import 'package:home_garden/widgets/long_button.dart';
import 'package:home_garden/widgets/rounded_input_field.dart';

import '../../services/auth/bloc/auth_bloc.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  static const pageRoute = "forgot-password";

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 143, 182, 250),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.3,
            ),
            const Text(
              "Forgot Password",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Enter your email address. Password reset link will be sent to your email. After resetting the password, go back and login again.",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RoundedInputField(
                      hintText: "Email",
                      icon: Icons.mail_rounded,
                      controller: _controller,
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    LongButton(
                      text: "Send Password Reset Link",
                      onTap: () async {
                        final email = _controller.text;
                        context.read<AuthBloc>().add(
                              AuthEventForgotPassword(email: email),
                            );
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(
                          SignInScreen.pageRoute,
                        );
                      },
                      child: const Text(
                        "Go back to the Sign In page.",
                        style: TextStyle(
                          color: buttonBgColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
