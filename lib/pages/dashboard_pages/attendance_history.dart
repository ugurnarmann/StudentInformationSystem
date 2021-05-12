import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:yoklama_sistemi/pages/base_widgets/header.dart';
import 'package:yoklama_sistemi/pages/dashboard.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/avatar_and_name.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/card_widget.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/exit_button.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/go_back_button.dart';

class AttendanceHistory extends StatefulWidget {
  AttendanceHistory({Key key}) : super(key: key);

  @override
  _AttendanceHistory createState() => _AttendanceHistory();
}

class _AttendanceHistory extends State<AttendanceHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Header(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  AvatarAndName(
                    networkImageUrl:
                        'https://i2.cnnturk.com/i/cnnturk/75/650x325/6071939370380e1c146d319c.jpg',
                    name: 'Cengiz Şen',
                    title: 'Bilgisayar Mühendisliği',
                    headerRightButton: GoBackButton(
                      goBackPage: DashboardScreen(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
