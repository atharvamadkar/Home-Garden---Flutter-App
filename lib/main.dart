import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_garden/screens/helper/loading_screen.dart';
import 'package:home_garden/screens/logIn/create_user_screen.dart';
import 'package:home_garden/screens/logIn/first_screen.dart';
import 'package:home_garden/screens/logIn/forgot_password_screen.dart';
import 'package:home_garden/screens/logIn/sign_in_screen.dart';
import 'package:home_garden/screens/logIn/verify_email_screen.dart';
import 'package:home_garden/screens/mainApp/home_screen.dart';
import 'package:home_garden/services/auth/bloc/auth_bloc.dart';
import 'package:home_garden/services/auth/bloc/auth_event.dart';
import 'package:home_garden/services/auth/bloc/auth_state.dart';
import 'package:home_garden/services/auth/firebase_auth_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Garden',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(
          FirebaseAuthProvider(),
        ),
        child: const HomePage(),
      ),
      routes: {
        FirstScreen.pageRoute: (context) => const FirstScreen(),
        SignInScreen.pageRoute: (context) => const SignInScreen(),
        SignUpScreen.pageRoute: (context) => const SignUpScreen(),
        ForgotPassword.pageRoute: (context) => const ForgotPassword(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(
          const AuthEventInitialize(),
        );
    return BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthStateLoggedIn) {
        return const HomeScreen();
      } else if (state is AuthStateNeedsVerification) {
        return const VerifyEmailScreen();
      } else if (state is AuthStateLoggedOut) {
        return const FirstScreen();
      } else {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }
    }, listener: (context, state) {
      if (state.isLoading) {
        LoadingScreen().show(
          context: context,
          text: state.loadingText ?? "Please wait a moment...",
        );
      } else {
        LoadingScreen().hide();
      }
    });
  }
}
