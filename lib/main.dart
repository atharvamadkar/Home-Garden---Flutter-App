import 'package:flutter/material.dart';
import 'package:home_garden/screens/logIn/create_user_screen.dart';
import 'package:home_garden/screens/logIn/first_screen.dart';
import 'package:home_garden/screens/logIn/forgot_password_screen.dart';
import 'package:home_garden/screens/logIn/sign_in_screen.dart';
import 'package:home_garden/screens/mainApp/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),
      routes: {
        FirstScreen.pageRoute: (context) => const FirstScreen(),
        SignInScreen.pageRoute: (context) => const SignInScreen(),
        SignUpScreen.pageRoute: (context) => const SignUpScreen(),
        ForgotPassword.pageRoute: (context) => const ForgotPassword(),
      },
    );
  }
}
