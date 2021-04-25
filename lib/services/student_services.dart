import 'package:yoklama_sistemi/models/student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentService {
  final students = FirebaseFirestore.instance.collection('students');
  Future<void> addStudent(Student student) {
    return students.add({
      'id': student.id,
      'name': student.name,
      'mail': student.mail,
      'faculty': student.faculty,
      'photo': student.photo,
    });
  }

   Stream<QuerySnapshot> getAllStudents() {
     return students.orderBy('name').snapshots();
  }
}
