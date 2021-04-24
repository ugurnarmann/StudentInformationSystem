import 'package:flutter/material.dart';
import 'package:yoklama_sistemi/pages/admin_dashboard.dart';
import 'package:yoklama_sistemi/pages/dashboard.dart';
import 'package:yoklama_sistemi/services/auth.dart';

class AuthDashboard {
  navigate(BuildContext context, AuthService data) {
    if (data.name != 'unarman@gmail.com') {
      return Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => DashboardScreen(),
        ),
      );
    }
    else
    {
      return Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => AdminDashboard(),
        ),
      );
    }
  }
}
