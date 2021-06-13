import 'package:flutter/material.dart';
import 'package:yoklama_sistemi/models/student.dart';
import 'package:yoklama_sistemi/pages/admin_dashboard.dart';
import 'package:yoklama_sistemi/pages/base_widgets/header.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/avatar_and_name.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/go_back_button.dart';
import 'package:yoklama_sistemi/services/auth.dart';
import 'package:yoklama_sistemi/services/student_services.dart';

StudentService studentService = StudentService();
AuthService authService = AuthService();

class AddStudentPage extends StatefulWidget {
  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  GlobalKey<FormState> _formState = GlobalKey();
  String name = "";
  String mail = "";
  String password = "";
  String faculty = "";
  String deph = "";
  String photoUrl =
      "https://img.favpng.com/18/23/22/computer-icons-student-education-medicine-course-png-favpng-rbtuet1v21tqH9nWyu97s7sgt.jpg";
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
                      'Öğrenci Ekle',
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
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(photoUrl),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            photoUrl = studentService.uploadPhoto();
                          });
                        },
                        child: Text("ekle"),
                      ),
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty ? "Bu alan boş olamaz!" : null;
                        },
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Adı ve soyadı giriniz",
                            labelText: "Ad Soyad"),
                      ),
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty ? "Bu alan boş olamaz!" : null;
                        },
                        onChanged: (value) {
                          setState(() {
                            mail = value;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Mail adresi giriniz",
                            labelText: "Mail"),
                      ),
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty ? "Bu alan boş olamaz!" : null;
                        },
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Şifre giriniz",
                            labelText: "Şifre"),
                      ),
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty ? "Bu alan boş olamaz!" : null;
                        },
                        onChanged: (value) {
                          setState(() {
                            faculty = value;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Fakülte giriniz",
                            labelText: "Fakülte"),
                      ),
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty ? "Bu alan boş olamaz!" : null;
                        },
                        onChanged: (value) {
                          setState(() {
                            deph = value;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Bölümü giriniz",
                            labelText: "Bölüm"),
                      ),
                      TextButton(
                        onPressed: () async {
                          await studentService.addStudent(
                            Student(
                              name: name,
                              mail: mail,
                              faculty: faculty,
                              photo: photoUrl,
                              deph: deph,
                            ),
                          );
                          await authService.registerUserWithEmailAndPassword(
                              mail, password);
                          _formState.currentState.reset();
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actions: [
                                    Text("Öğrenci Oluşturuldu !"),
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Kapat'),
                                    )
                                  ],
                                );
                              });
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
