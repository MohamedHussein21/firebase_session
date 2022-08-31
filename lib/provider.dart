import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_session/users_model.dart';
import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier {
  void userRegister({
    required String name,
    required String email,
    required String password,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print('Error');
      createUser(
          name: name, email: email, password: password, uId: value.user!.uid);
    }).catchError((error) {});
    notifyListeners();
  }

  void createUser({
    required String name,
    required String email,
    required String password,
    required String uId,
  }) {
    print('create Erro');
    UserModel userModel = UserModel(
      name: name,
      email: email,
      password: password,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap());
  }

  bool isShowPass = true;

  IconData suffix = Icons.visibility_outlined;

  void changePassVisibility() {
    isShowPass = !isShowPass;
    suffix =
        isShowPass ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    notifyListeners();
  }
}
