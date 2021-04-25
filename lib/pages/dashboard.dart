import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:yoklama_sistemi/pages/base_widgets/header.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/avatar_and_name.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/card_widget.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/exit_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key key, LoginData email}) : super(key: key);

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
                    headerRightButton: ExitButton(),
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      children: [
                        CardWidgetButton(
                          assetImageDirectory: 'assets/images/student.svg',
                          text: 'Bilgilerim',
                        ),
                        CardWidgetButton(
                          assetImageDirectory: 'assets/images/calendar.svg',
                          text: 'Takvim',
                        ),
                        CardWidgetButton(
                          assetImageDirectory: 'assets/images/lesson.svg',
                          text: 'Derslerim',
                        ),
                        CardWidgetButton(
                          assetImageDirectory: 'assets/images/inlesson.svg',
                          text: 'Katıldığım Dersler',
                        ),
                      ],
                      crossAxisCount: 2,
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
