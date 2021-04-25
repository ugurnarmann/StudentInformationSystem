import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:yoklama_sistemi/pages/admin_dashboard_pages/add_lesson_page.dart';
import 'package:yoklama_sistemi/pages/admin_dashboard_pages/add_student_page.dart';
import 'package:yoklama_sistemi/pages/admin_dashboard_pages/show_lesson_page.dart';
import 'package:yoklama_sistemi/pages/admin_dashboard_pages/show_student_page.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/exit_button.dart';
import 'package:yoklama_sistemi/services/student_services.dart';

import 'base_widgets/header.dart';
import 'dashboard_wigets/avatar_and_name.dart';
import 'dashboard_wigets/card_widget.dart';

StudentService _studentService = StudentService();
List students = [];

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key key, LoginData email}) : super(key: key);
  
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
                        'https://www.tccb.gov.tr/assets/resim/genel/receptayyiperdogan-bio.jpg',
                    name: 'Yönetici',
                    title: 'Sistem Yöneticisi',
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
                          text: 'Öğrenci ekle',
                          navigateTo: AddStudentPage(),
                        ),
                        CardWidgetButton(
                          assetImageDirectory: 'assets/images/lesson.svg',
                          text: 'Ders Ekle',
                          navigateTo: AddLessonPage(),
                        ),
                        CardWidgetButton(
                          assetImageDirectory: 'assets/images/inlesson.svg',
                          text: 'Öğrencileri Göster/Düzenle',
                          navigateTo: ShowStudentPage(),
                        ),
                        CardWidgetButton(
                          assetImageDirectory: 'assets/images/books.svg',
                          text: 'Dersleri Göster/Düzenle',
                          navigateTo: ShowLessonPage(),
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
