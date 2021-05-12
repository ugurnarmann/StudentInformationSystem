import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yoklama_sistemi/models/student.dart';
import 'package:yoklama_sistemi/pages/admin_dashboard.dart';
import 'package:yoklama_sistemi/pages/base_widgets/header.dart';
import 'package:yoklama_sistemi/pages/base_widgets/text_styles.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/avatar_and_name.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/go_back_button.dart';
import 'package:yoklama_sistemi/services/auth.dart';
import 'package:yoklama_sistemi/services/student_services.dart';

TextStyles _textStyles = TextStyles();
StudentService _studentService = StudentService();
AuthService _authService = AuthService();

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
                      'Öğrencileri Göster / \nDüzenle',
                      style: _textStyles.h1Style(),
                      textAlign: TextAlign.center,
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
                          DocumentSnapshot student = snapshot.data.docs[index];
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 32,
                                backgroundImage: NetworkImage(
                                  student['photo'],
                                ),
                              ),
                              title: Text(student['name']),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(student['faculty']),
                                  SizedBox(
                                    height: 2.5,
                                  ),
                                  Text(student['deph']),
                                ],
                              ),
                              isThreeLine: true,
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    color: Colors.black38,
                                    onPressed: () async {
                                      createEditPage(
                                          context, snapshot.data.docs[index]);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    color: Colors.black38,
                                    onPressed: () async {
                                      setState(() {
                                        _studentService.deleteStudent(
                                            snapshot.data.docs[index].id);
                                        _authService.deleteUserWithEmail(
                                            snapshot.data.docs[index]['mail']);
                                      });
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

createEditPage(context, snapsotData) async {
  var _id = TextEditingController(text: snapsotData['id']);
  var _name = TextEditingController(text: snapsotData['name']);
  var _mail = TextEditingController(text: snapsotData['mail']);
  var _photo = TextEditingController(text: snapsotData['photo']);
  var _faculty = TextEditingController(text: snapsotData['faculty']);
  var _deph = TextEditingController(text: snapsotData['deph']);

  String photoUrl = snapsotData['photo'];
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('İptal'),
          ),
          TextButton(
            onPressed: () {
              _studentService.updateStudent(
                snapsotData.id,
                Student(
                  name: _name.text,
                  mail: _mail.text,
                  photo: _photo.text,
                  faculty: _faculty.text,
                  deph: _deph.text,
                ),
              );
              Navigator.pop(context);
            },
            child: Text('Gücelle'),
          )
        ],
        title: Text(
          'Öğrenci Düzenle',
          style: _textStyles.hStyle(),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Text('Fotoğraf'),
              SizedBox(
                height: 20,
              ),
              (photoUrl != null)
                  ? CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        photoUrl,
                      ),
                    )
                  : Text('No image !'),
              TextButton(
                onPressed: () {
                  _photo = _studentService.uploadPhoto();
                  photoUrl = _photo.text;
                },
                child: Text('Güncelle'),
              ),
              
              Text('Öğrenci ID'),
              Text(
                snapsotData['id'].toString(),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Ad Soyad'),
              TextField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: snapsotData['name'],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Mail'),
              TextField(
                controller: _mail,
                decoration: InputDecoration(
                  hintText: snapsotData['mail'],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Text('Fakülte'),
              TextField(
                controller: _faculty,
                decoration: InputDecoration(
                  hintText: snapsotData['faculty'],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Bölüm'),
              TextField(
                controller: _deph,
                decoration: InputDecoration(
                  hintText: snapsotData['deph'],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
