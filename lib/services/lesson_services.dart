import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoklama_sistemi/models/lesson.dart';
import 'package:yoklama_sistemi/models/teacher.dart';

class LessonService {
  final lessons = FirebaseFirestore.instance.collection('lessons');
  Future<void> addLesson(Lesson lesson) {
    return lessons.add({
      'lessonName': lesson.lessonName,
      'teacherName': lesson.teacherName,
    });
  }

  deleteLesson(selectedDoc) async {
    await lessons.doc(selectedDoc).delete().catchError((e) {
      print(e);
    });
  }

  Stream<QuerySnapshot> getAllLessons() {
    return lessons.orderBy('lessonName').snapshots();
  }
}
