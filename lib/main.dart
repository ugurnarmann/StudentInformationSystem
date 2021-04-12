import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

//import 'dashboard_screen.dart';

main(List<String> args) async {
 /* WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();*/
  runApp(LoginScreen());
}
/*
void _dbUser() {
  DatabaseReference _dbUser =
      FirebaseDatabase.instance.reference().child("user");
}*/

const users = const {
  'unarman@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlutterLogin(
        hideForgotPasswordButton: true,
        logo: 'assets/images/yoksislogo.png',
        onLogin: _authUser,
        onSignup: _authUser,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => DashboardScreen(),
          ));
        },
        onRecoverPassword: _recoverPassword,
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Dashboard"),
    );
  }
}
