import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key key, LoginData email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'ADMIN DASHBOARD EKRANI !',
        ),
      ),
    );
  }
}