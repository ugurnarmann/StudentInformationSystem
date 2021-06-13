import 'package:flutter/material.dart';
import 'package:yoklama_sistemi/models/lesson.dart';
import 'package:yoklama_sistemi/pages/admin_dashboard.dart';
import 'package:yoklama_sistemi/pages/base_widgets/header.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/avatar_and_name.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/go_back_button.dart';
import 'package:yoklama_sistemi/services/lesson_services.dart';

LessonService _lessonService = LessonService();

class AddLessonPage extends StatefulWidget {
  @override
  _AddLessonPageState createState() => _AddLessonPageState();
}

class _AddLessonPageState extends State<AddLessonPage> {
  String lessonName = "";
  String teacherName = "";
  GlobalKey<FormState> _formState = GlobalKey();
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
                      'Ders Ekle',
                      style: TextStyle(
                        fontFamily: 'Montserrat Medium',
                        color: Colors.black38,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Form(
                  key: _formState,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty ? "Bu alan boş olamaz!" : null;
                        },
                        onChanged: (value) {
                          setState(() {
                            lessonName = value;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Ders Adı giriniz",
                            labelText: "Ders Adı"),
                      ),
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty ? "Bu alan boş olamaz!" : null;
                        },
                        onChanged: (value) {
                          setState(() {
                            teacherName = value;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Öğretmen Adını giriniz",
                            labelText: "Öğretmen Adı"),
                      ),
                      TextButton(
                        onPressed: () async {
                          if (_formState.currentState.validate()) {
                            await _lessonService.addLesson(Lesson(
                                lessonName: lessonName,
                                teacherName: teacherName));
                            setState(() {
                              _formState.currentState.reset();
                            });
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    actions: [
                                      Text("Ders Oluşturuldu !"),
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Kapat'),
                                      )
                                    ],
                                  );
                                });
                          } else {
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    actions: [
                                      Text("Hata oluştu!"),
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Kapat'),
                                      )
                                    ],
                                  );
                                });
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              "Ekle",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
