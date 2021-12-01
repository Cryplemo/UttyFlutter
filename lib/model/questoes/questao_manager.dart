import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utty_flutter/model/questoes/questao.dart';

class QuestaoManager extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Questao> questoes = [];
  final PageController _pageController = PageController();
  PageController get pageController => _pageController;
  late int questaoSelecionada;

  bool _alternativa1 = false;
  bool get alternativa1 => _alternativa1;
  set alternativa1(bool novaValorAlternativa) {
    _alternativa1 = novaValorAlternativa;
    notifyListeners();
  }

  bool _alternativa2 = false;
  bool get alternativa2 => _alternativa2;
  set alternativa2(bool novaValorAlternativa) {
    _alternativa2 = novaValorAlternativa;
    notifyListeners();
  }

  bool _alternativa3 = false;
  bool get alternativa3 => _alternativa3;
  set alternativa3(bool novaValorAlternativa) {
    _alternativa3 = novaValorAlternativa;
    notifyListeners();
  }

  bool _alternativa4 = false;
  bool get alternativa4 => _alternativa4;
  set alternativa4(bool novaValorAlternativa) {
    _alternativa4 = novaValorAlternativa;
    notifyListeners();
  }

  void verificarOutrasAlternativasSelecionadas(int numeroAlternativa) {
    questaoSelecionada = numeroAlternativa;
    switch (numeroAlternativa) {
      case 1:
        alternativa1 = true;
        alternativa2 = false;
        alternativa3 = false;
        alternativa4 = false;
        break;
      case 2:
        alternativa1 = false;
        alternativa2 = true;
        alternativa3 = false;
        alternativa4 = false;
        break;
      case 3:
        alternativa1 = false;
        alternativa2 = false;
        alternativa3 = true;
        alternativa4 = false;
        break;
      case 4:
        alternativa1 = false;
        alternativa2 = false;
        alternativa3 = false;
        alternativa4 = true;
        break;
      default:
        alternativa1 = false;
        alternativa2 = false;
        alternativa3 = false;
        alternativa4 = false;
    }
  }

  Future<void> getQuestoesMatematica() async {
    final docs = await firestore.collection("Matematica").get();
    docs.docs.forEach((questao) {
      questoes.add(Questao.fromDocumentSnapshot(questao));
    });
  }

  Future<void> verificarResposta(int respostaSelecionada, int respostaCorreta,
      BuildContext buildContext) async {
    if (respostaSelecionada == respostaCorreta) {
      AlertDialog(
        title: Text("                        Parabéns"),
        content: Text("Alternativa correta."),
      );
      ;
    } else {
      AlertDialog(
        title: Text("                        Essa Não"),
        content: Text("Alternativa incorreta."),
      );
      ;
    }
  }

  void proximaPergunta() {
    pageController.nextPage(
        duration: Duration(seconds: 1), curve: Curves.easeIn);
  }
}
