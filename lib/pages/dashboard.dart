import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:yoklama_sistemi/pages/base_widgets/header.dart';
import 'package:yoklama_sistemi/pages/dashboard_pages/attendance_history.dart';
import 'package:yoklama_sistemi/pages/dashboard_pages/calendar_page.dart';
import 'package:yoklama_sistemi/pages/dashboard_pages/my_accound_page.dart';
import 'package:yoklama_sistemi/pages/dashboard_pages/my_lesson.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/avatar_and_name.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/card_widget.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/exit_button.dart';
import 'package:yoklama_sistemi/services/auth.dart';
import 'package:yoklama_sistemi/services/student_services.dart';

StudentService _studentService = StudentService();

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Header(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: StreamBuilder(
                stream: _studentService.getStudent(),
                builder: (BuildContext context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    children: [
                      AvatarAndName(
                        networkImageUrl: snapshot.data.docs[0]['photo'],
                        name: snapshot.data.docs[0]['name'],
                        title: snapshot.data.docs[0]['deph'],
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
                              navigateTo: MyAccountScreen(),
                            ),
                            CardWidgetButton(
                              assetImageDirectory: 'assets/images/calendar.svg',
                              text: 'Takvim',
                              navigateTo: CalendarScreen(),
                            ),
                            CardWidgetButton(
                              assetImageDirectory: 'assets/images/lesson.svg',
                              text: 'Derslerim',
                              navigateTo: MyLessonScreen(),
                            ),
                            CardWidgetButton(
                              assetImageDirectory: 'assets/images/inlesson.svg',
                              text: 'Katıldığım Dersler',
                              navigateTo: AttendanceHistory(),
                            ),
                          ],
                          crossAxisCount: 2,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
