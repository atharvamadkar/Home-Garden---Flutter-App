import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_garden/constants/app_colors.dart';
import 'package:home_garden/screens/logIn/create_user_screen.dart';
import 'package:home_garden/services/auth/bloc/auth_event.dart';
import 'package:home_garden/widgets/long_button.dart';
import 'package:home_garden/widgets/rounded_input_field.dart';

import '../../services/auth/bloc/auth_bloc.dart';
import '../../widgets/password_input_field.dart';
import 'forgot_password_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  static const pageRoute = "sign-in-screen";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
                height: height * 0.75,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Text(
                      "Please sign in to continue.",
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    RoundedInputField(
                      onChanged: (value) {},
                      hintText: "Email",
                      icon: Icons.mail_rounded,
                      controller: _emailController,
                      hintextColor: hintTextColor,
                    ),
                    PasswordInputField(
                      passwordController: _passwordController,
                      hintTextColor: hintTextColor,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    LongButton(
                      text: "Sign In",
                      onTap: () async {
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        context.read<AuthBloc>().add(
                              AuthEventLogin(
                                email: email,
                                password: password,
                              ),
                            );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ForgotPassword.pageRoute);
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: buttonBgColor,
                        ),
                      ),
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
                          "Don't have an account?",
                          style: TextStyle(
                            color: hintTextColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              SignUpScreen.pageRoute,
                            );
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: buttonBgColor),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
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
