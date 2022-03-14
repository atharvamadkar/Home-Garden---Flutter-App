import 'package:flutter/material.dart';
import 'package:home_garden/widgets/long_button.dart';
import 'package:home_garden/widgets/password_input_field.dart';
import 'package:home_garden/widgets/rounded_input_field.dart';

import '../../constants/app_colors.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const pageRoute = "sign-up";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _repeatPasswordController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _repeatPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/bg1.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Container(
                height: size.height * 0.8,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * .07,
                    ),
                    const Text(
                      "Create User",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RoundedInputField(
                      hintText: "Full Name",
                      icon: Icons.person,
                      controller: _nameController,
                      onChanged: (value) {},
                    ),
                    RoundedInputField(
                      hintText: "Email",
                      icon: Icons.mail_rounded,
                      controller: _nameController,
                      onChanged: (value) {},
                    ),
                    PasswordInputField(
                      passwordController: _passwordController,
                    ),
                    PasswordInputField(
                      passwordController: _repeatPasswordController,
                      hintText: "Confirm Password",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const LongButton(
                      text: "Sign Up",
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: hintTextColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              SignInScreen.pageRoute,
                            );
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(color: buttonBgColor),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
