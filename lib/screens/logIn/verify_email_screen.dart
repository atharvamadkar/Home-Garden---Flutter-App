import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_garden/constants/app_colors.dart';
import 'package:home_garden/screens/logIn/sign_in_screen.dart';
import 'package:home_garden/services/auth/bloc/auth_bloc.dart';
import 'package:home_garden/services/auth/bloc/auth_event.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 143, 182, 250),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.3,
            ),
            const Text(
              "Verify Your Email",
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
              "We've sent you an email verification link. Please open it and verify your email. After verification Sign In into your account.",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "If you haven't received your email verification link, press the button below to resend it.",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: buttonBgColor,
              ),
              onPressed: () {
                context.read<AuthBloc>().add(
                      const AuthEventSendEmailVerification(),
                    );
              },
              icon: const Icon(
                Icons.replay_outlined,
                color: textColor,
              ),
              label: const Text(
                "Resend link",
                style: TextStyle(color: textColor),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: buttonBgColor,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(
                  SignInScreen.pageRoute,
                );
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: textColor,
              ),
              label: const Text(
                "Sign In",
                style: TextStyle(color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
