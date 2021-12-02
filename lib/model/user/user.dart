import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  int? acertos;
  int? erros;
  String? senha;
  String? email;

  UserModel();

  UserModel.fromFirebase(DocumentSnapshot doc) {
    email = doc.get("email");
    id = doc.get("id");
    acertos = doc.get("acertos");
    erros = doc.get("erros");
  }
}
