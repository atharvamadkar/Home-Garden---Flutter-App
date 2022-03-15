import 'package:bloc/bloc.dart';
import 'package:home_garden/services/auth/auth_provider.dart';
import 'package:home_garden/services/auth/bloc/auth_event.dart';
import 'package:home_garden/services/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthProvider provider)
      : super(const AuthStateUnitialized(isLoading: true)) {
    // Register
    on<AuthEventRegister>(
      ((event, emit) async {
        final email = event.email;
        final password = event.password;
        //final fullName = event.fullName;
        try {
          await provider.createUser(
            email: email,
            password: password,
          );
        } on Exception catch (e) {
          emit(
            AuthStateException(isLoading: false, exception: e),
          );
        }
      }),
    );

    //initialize
    on<AuthEventInitialize>(
      (event, emit) async {
        await provider.initialize();
        final user = provider.currentUser;
        if (user == null) {
          emit(
            const AuthStateLoggedOut(exception: null, isLoading: false),
          );
        } else if (!user.isEmailVerified) {
          emit(
            const AuthStateNeedsVerification(isLoading: false),
          );
        } else {
          emit(
            AuthStateLoggedIn(user: user, isLoading: false),
          );
        }
      },
    );

    //Log In
    on<AuthEventLogin>(
      (event, emit) async {
        emit(
          const AuthStateLoggedOut(
            exception: null,
            isLoading: true,
            loadingText: "Please wait while we log you in",
          ),
        );
        final email = event.email;
        final password = event.password;
        try {
          final user = await provider.logIn(
            email: email,
            password: password,
          );
          if (!user.isEmailVerified) {
            emit(
              const AuthStateLoggedOut(
                exception: null,
                isLoading: false,
              ),
            );
            emit(
              const AuthStateNeedsVerification(isLoading: false),
            );
          } else {
            emit(
              const AuthStateLoggedOut(
                exception: null,
                isLoading: false,
              ),
            );
            emit(
              AuthStateLoggedIn(
                user: user,
                isLoading: false,
              ),
            );
          }
        } on Exception catch (e) {
          emit(
            AuthStateLoggedOut(
              exception: e,
              isLoading: false,
            ),
          );
        }
      },
    );

    //Log Out
    on<AuthEventLogOut>(
      (event, emit) async {
        try {
          await provider.logOut();
          emit(
            const AuthStateLoggedOut(
              exception: null,
              isLoading: false,
            ),
          );
        } on Exception catch (e) {
          emit(
            AuthStateLoggedOut(
              exception: e,
              isLoading: false,
            ),
          );
        }
      },
    );

    //Send Email Verification
    on<AuthEventSendEmailVerification>(
      (event, emit) async {
        await provider.initialize();
        emit(state);
      },
    );

    //Forgot Password
    on<AuthEventForgotPassword>(
      (event, emit) async {
        final email = event.email;
        if (email == null) return;
        bool didSendEmail;
        Exception? exception;

        try {
          await provider.sendPasswordReset(
            email: email,
          );
          didSendEmail = true;
          exception = null;
        } on Exception catch (e) {
          didSendEmail = false;
          exception = e;
        }
        emit(
          AuthStateForgotPassword(
            exception: exception,
            hasSentEmail: didSendEmail,
            isLoading: false,
          ),
        );
      },
    );
  }
}
