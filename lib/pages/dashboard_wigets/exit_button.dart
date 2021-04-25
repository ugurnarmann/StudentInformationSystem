import 'package:flutter/material.dart';
import 'package:yoklama_sistemi/pages/login.dart';
import 'package:yoklama_sistemi/services/auth.dart';

class ExitButton extends StatefulWidget {
  @override
  _ExitButtonState createState() => _ExitButtonState();
}

AuthService _authService = AuthService();

class _ExitButtonState extends State<ExitButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {
        _authService.signOut,
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        )
      },
      child: Container(
        alignment: AlignmentDirectional.topEnd,
        child: Icon(
          Icons.exit_to_app_outlined,
          size: 40,
        ),
      ),
    );
  }
}
