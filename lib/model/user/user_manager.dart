import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:utty_flutter/model/user/user.dart';

class UserManager extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  UserModel userModel = UserModel();

  Future<void> logout(BuildContext context) async {
    await auth.signOut();
    Navigator.of(context).pushNamed('/');
  }

  get emailUsuario => auth.currentUser!.email;

  Future<void> cadastrarUsuario(String email, String senha) async {
    await auth.createUserWithEmailAndPassword(email: email, password: senha);
  }

  Future<void> logarUsuario(String email, String senha,
      {required Function onSuccess}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: senha);
      onSuccess();
    } catch (e) {
      print(e);
    }
  }
}
