import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:utty_flutter/model/user/user.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    loadCurrentUser();
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool novaValorAlternativa) {
    _loading = novaValorAlternativa;
    notifyListeners();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  UserModel userModel = UserModel();

  Future<void> logout(BuildContext context) async {
    await auth.signOut();
    Navigator.of(context).pushNamed('login');
    userModel = UserModel();
    notifyListeners();
  }

  Future<void> loadCurrentUser() async {
    try {
      User currentUser = auth.currentUser!;
      if (currentUser != null) {
        final DocumentSnapshot docUser =
            await firestore.collection('users').doc(currentUser.uid).get();
        userModel = UserModel.fromFirebase(docUser);
        print(userModel);
      }
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  String? emailUsuario() {
    if (auth.currentUser != null) {
      return auth.currentUser!.email;
    }
    return "";
  }

  Future<void> cadastrarUsuario(String email, String senha,
      {required Function onSuccess, required Function onFail}) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
          email: email, password: senha);
      final Map<String, dynamic> map = {
        'email': userModel.email,
        "id": credential.user!.uid,
        "acertos": 0,
        "erros": 0,
      };
      await firestore.collection("users").doc(credential.user!.uid).set(map);
      onSuccess();
    } catch (e) {
      onFail();
    }
  }

  Future<void> logarUsuario(String email, String senha,
      {required Function onSuccess, required Function onFail}) async {
    try {
      loading = true;
      await auth.signInWithEmailAndPassword(email: email, password: senha);
      await loadCurrentUser();
      onSuccess();
    } catch (e) {
      onFail();
    } finally {
      loading = false;
    }
  }
}
