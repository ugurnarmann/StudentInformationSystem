import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yoklama_sistemi/pages/admin_dashboard.dart';
import 'package:yoklama_sistemi/pages/base_widgets/header.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/avatar_and_name.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/go_back_button.dart';
import 'package:yoklama_sistemi/services/student_services.dart';

StudentService _studentService = StudentService();

class ShowStudentPage extends StatefulWidget {
  @override
  _ShowStudentPageState createState() => _ShowStudentPageState();
}

class _ShowStudentPageState extends State<ShowStudentPage> {
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
                      'Öğrencileri Göster',
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
                        stream: _studentService.getAllStudents(),
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
                              DocumentSnapshot student =
                                  snapshot.data.docs[index];
                              return Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 32,
                                    backgroundImage: NetworkImage(
                                      student['photo'],
                                    ),
                                  ),
                                  title: Text(student['name']),
                                  subtitle: Text(student['faculty']),
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
