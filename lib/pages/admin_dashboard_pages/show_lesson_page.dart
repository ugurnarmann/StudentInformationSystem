import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yoklama_sistemi/pages/admin_dashboard.dart';
import 'package:yoklama_sistemi/pages/base_widgets/header.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/avatar_and_name.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/go_back_button.dart';
import 'package:yoklama_sistemi/services/lesson_services.dart';

LessonService _lessonService = new LessonService();

class ShowLessonPage extends StatefulWidget {
  @override
  _ShowLessonPageState createState() => _ShowLessonPageState();
}

class _ShowLessonPageState extends State<ShowLessonPage> {
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
                      'Dersleri Göster',
                      style: TextStyle(
                        fontFamily: 'Montserrat Medium',
                        color: Colors.black38,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: StreamBuilder(
                    stream: _lessonService.getAllLessons(),
                    builder: (BuildContext context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.size,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot lesson = snapshot.data.docs[index];
                          return Card(
                            child: ListTile(
                              /*leading: CircleAvatar(
                                radius: 32,
                                backgroundImage: NetworkImage(
                                  lesson['photo'],
                                ),
                              ),*/
                              title: Text(lesson['lesson_name']),
                              subtitle: Text(lesson['teacher_name']),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
