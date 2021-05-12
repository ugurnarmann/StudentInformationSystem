import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_login/flutter_login.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  String name;
  String password;

//giriş yap
  Future<String> signIn(LoginData data) async {
    this.name = data.name;
    this.password = data.password;
    try {
      await _auth.signInWithEmailAndPassword(email: name, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "Kullanıcı Bulunamadı !";
      } else if (e.code == 'wrong-password') {
        return "Kullanıcı Ve Şifre Eşleşmedi !";
      } else {
        return "Teknik Hata.";
      }
    }
  }

//çıkış yap
  signOut() async {
    return await _auth.signOut();
  }

//kayıt et
  Future<User> registerStudent(
      String email, String password, String name, String lastName) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _fireStore
        .collection("Student")
        .doc(user.user.uid)
        .set({'name': name, 'lastName': lastName});
    return user.user;
  }

  Future registerUserWithEmailAndPassword(String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var user = result.user;
      return user.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future deleteUserWithEmail(String email) async {
    try {
      var user = _auth.currentUser;
      await user.delete();
      return user.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
