import 'package:flutter/material.dart';
import 'package:yoklama_sistemi/pages/admin_dashboard.dart';
import 'package:yoklama_sistemi/pages/base_widgets/header.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/avatar_and_name.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/go_back_button.dart';

class AddLessonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Header(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                AvatarAndName(
                  networkImageUrl:
                      'https://www.tccb.gov.tr/assets/resim/genel/receptayyiperdogan-bio.jpg',
                  name: 'Yönetici',
                  title: 'Sistem Yöneticisi',
                  headerRightButton: GoBackButton(
                    goBackPage: AdminDashboard(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ders Ekle',
                      style: TextStyle(
                        fontFamily: 'Montserrat Medium',
                        color: Colors.black38,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
