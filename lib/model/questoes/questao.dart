import 'package:cloud_firestore/cloud_firestore.dart';

class Questao {
  String? questao;
  String? alternativa1;
  String? alternativa2;
  String? alternativa3;
  String? alternativa4;
  String? resolucao;
  int? numeroResposta;

  Questao.fromDocumentSnapshot(QueryDocumentSnapshot documentSnapshot) {
    alternativa1 = documentSnapshot.get("alt1");
    alternativa2 = documentSnapshot.get("alt2");
    alternativa3 = documentSnapshot.get("alt3");
    alternativa4 = documentSnapshot.get("alt4");
    questao = documentSnapshot.get("questao");
    numeroResposta = documentSnapshot.get("resposta");
    resolucao = documentSnapshot.get("resolucao");
  }
}
