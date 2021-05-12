import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:yoklama_sistemi/models/student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yoklama_sistemi/services/auth.dart';

class StudentService {
  final students = FirebaseFirestore.instance.collection('students');
  final storage = FirebaseStorage.instance;
  final auth = AuthService();
  Future<void> addStudent(Student student) {
    return students.add({
      'id': student.id,
      'name': student.name,
      'mail': student.mail,
      'faculty': student.faculty,
      'deph':student.deph,
      'photo': student.photo,
    });
  }

  Stream<QuerySnapshot> getAllStudents() {
    return students.orderBy('name').snapshots();
  }

  updateStudent(selectedDoc, Student data) async {
    students.doc(selectedDoc).set({
      'id': data.id,
      'name': data.name,
      'mail': data.mail,
      'photo': data.photo,
      'faculty': data.faculty,
      'deph': data.deph,
    }).catchError((e) {
      print(e);
    });
  }

  deleteStudent(selectedDoc) async {
    await students.doc(selectedDoc).delete().catchError((e) {
      print(e);
    });
    auth.deleteUserWithEmail(selectedDoc['mail']);
  }

  uploadPhoto() async {
    final _picker = ImagePicker();
    PickedFile photo;
    var photoUrl;

    await Permission.photos.request();
    var permissionsStatus = await Permission.photos.status;

    if (permissionsStatus.isGranted) {
      photo = await _picker.getImage(source: ImageSource.gallery);
      var file = File(photo.path);

      if (photo != null) {
        var snaphot =
            await storage.ref().child('studentsImage/photos').putFile(file);
        photoUrl = await snaphot.ref.getDownloadURL();
        return photoUrl;
      } else {
        print('not selected image!');
      }
    } else {
      print('Galeriye erişim izni alınmadı, Tekrar deneyin');
    }
  }
}
