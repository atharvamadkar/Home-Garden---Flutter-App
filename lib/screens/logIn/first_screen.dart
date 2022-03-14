import 'package:flutter/material.dart';
import 'package:home_garden/constants/app_colors.dart';
import 'package:home_garden/screens/logIn/create_user_screen.dart';
import 'package:home_garden/screens/logIn/forgot_password_screen.dart';
import 'package:home_garden/screens/logIn/sign_in_screen.dart';
import 'package:home_garden/widgets/long_button.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);
  static const pageRoute = "first-screen";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/bg1.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/hg_logo.jpg",
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(75),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "HELLO",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  Text(
                    "Please Login to continue",
                    style: TextStyle(
                      fontSize: 18,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            LongButton(
              onTap: () {
                Navigator.of(context).pushNamed(
                  SignInScreen.pageRoute,
                );
              },
              text: "Sign In",
              textColor: textColor,
              bgColor: buttonBgColor,
            ),
            const SizedBox(
              height: 15,
            ),
            LongButton(
              onTap: () {
                Navigator.of(context).pushNamed(
                  SignUpScreen.pageRoute,
                );
              },
              text: "Sign Up",
              textColor: buttonBgColor,
              bgColor: textColor,
            ),
            const SizedBox(
              height: 1,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ForgotPassword.pageRoute);
              },
              child: const Text(
                "Forgot Password? Click Here.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
