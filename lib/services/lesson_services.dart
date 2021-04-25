import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoklama_sistemi/models/teacher.dart';

class LessonService {
  final lessons = FirebaseFirestore.instance.collection('lessons');
  Future<void> addStudent(Teacher teacher) {
    return lessons.add({
      'id': teacher.id,
      'teacher_name': teacher.name,
      'mail': teacher.mail,
      'lesson_name': teacher.lessonName,
      'photo': teacher.photo,
    });
  }

   Stream<QuerySnapshot> getAllLessons() {
     return lessons.orderBy('lesson_name').snapshots();
  }
}
