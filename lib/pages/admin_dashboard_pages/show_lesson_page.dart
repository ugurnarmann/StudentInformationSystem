import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yoklama_sistemi/models/lesson.dart';
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
                      'https://tibatu.com/wp-content/uploads/2020/10/flat-business-man-user-profile-avatar-icon-vector-4333097-768x768.jpg',
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
                      'Dersleri Göster / \nDüzenle',
                      style: TextStyle(
                        fontFamily: 'Montserrat Medium',
                        color: Colors.black38,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
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
                              
                              title: Text(lesson['lessonName']),
                              subtitle: Text(lesson['teacherName']),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    color: Colors.black38,
                                    onPressed: () async{
                                       _lessonService.deleteLesson(lesson.id);
                                    },
                                  ),
                                ],
                              ),
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
