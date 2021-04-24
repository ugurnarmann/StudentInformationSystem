import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:yoklama_sistemi/services/auth.dart';
import 'package:yoklama_sistemi/services/auth_dashboard.dart';

import 'dashboard.dart';

AuthService _authService = AuthService();
AuthDashboard _authDashboard = AuthDashboard();

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterLogin(
        hideForgotPasswordButton: true,
        hideSignUpButton: true,
        logo: 'assets/images/yoksislogo.png',
        onLogin: _authService.signIn,
        onSignup: _authService.signIn,
        onSubmitAnimationCompleted: () {
          _authDashboard.navigate(context, _authService);
        },
        onRecoverPassword: (_) => Future(null),
        emailValidator: emailValidator,
        passwordValidator: passwordValidator,
        messages: LoginMessages(
          usernameHint: 'Email',
          passwordHint: 'Şifre',
          loginButton: 'Giriş',
          confirmPasswordHint: 'Password',
          flushbarTitleError: 'Hata !',
          flushbarTitleSuccess: 'Başarılı',
          goBackButton: 'Geri',
          confirmPasswordError: 'Yanlış Email Şifre Kombinasyonu !',
        ),
        theme: LoginTheme(
          primaryColor: Colors.green[500],
          accentColor: Colors.green[500],
        ),
      ),
    );
  }

  static final FormFieldValidator<String> emailValidator = (value) {
    if (value.isEmpty || !Regex.email.hasMatch(value)) {
      return 'Yanlış email!';
    }
    return null;
  };

  static final FormFieldValidator<String> passwordValidator = (value) {
    if (value.isEmpty || value.length <= 2) {
      return 'Şifre çok kısa!';
    }
    return null;
  };
}

class Regex {
  // https://stackoverflow.com/a/32686261/9449426
  static final email = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
}
