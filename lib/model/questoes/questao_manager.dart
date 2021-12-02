import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utty_flutter/global_dialog.dart';
import 'package:utty_flutter/model/questoes/questao.dart';
import 'package:utty_flutter/model/user/user.dart';

class QuestaoManager extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Questao> questoes = [];
  final PageController _pageController = PageController();
  PageController get pageController => _pageController;
  late int questaoSelecionada;
  get context => null;
  double ranking = 0.0;

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
    questoes = [];
    docs.docs.forEach((questao) {
      questoes.add(Questao.fromDocumentSnapshot(questao));
    });
  }

  Future<void> getQuestoesQuimica() async {
    final docs = await firestore.collection("Quimica").get();
    questoes = [];
    docs.docs.forEach((questao) {
      questoes.add(Questao.fromDocumentSnapshot(questao));
    });
  }

  Future<void> getQuestoesBiologia() async {
    final docs = await firestore.collection("Biologia").get();
    questoes = [];
    docs.docs.forEach((questao) {
      questoes.add(Questao.fromDocumentSnapshot(questao));
    });
  }

  Future<void> getQuestoesFisica() async {
    final docs = await firestore.collection("Fisica").get();
    questoes = [];
    docs.docs.forEach((questao) {
      questoes.add(Questao.fromDocumentSnapshot(questao));
    });
  }

  Future<void> verificarResposta(int respostaSelecionada, int respostaCorreta,
      BuildContext buildContext, UserModel userModel) async {
    if (respostaSelecionada == respostaCorreta) {
      CustomDialogs.dialogSucesso(buildContext);
      await incrementarAcerto(userModel);
    } else {
      CustomDialogs.dialogErro(buildContext);
      await incrementarErro(userModel);
    }
  }

  Future<void> incrementarAcerto(UserModel userModel) async {
    var numeroAcertos = userModel.acertos!;
    final novoNumeroAcertos = numeroAcertos + 1;
    await firestore
        .collection("users")
        .doc(userModel.id)
        .update({"acertos": novoNumeroAcertos});
  }

  Future<void> incrementarErro(UserModel userModel) async {
    var numeroErros = userModel.erros!;
    final novoNumeroErros = numeroErros + 1;
    await firestore
        .collection("users")
        .doc(userModel.id)
        .update({"erros": novoNumeroErros});
  }

  void proximaPergunta() {
    pageController.nextPage(
        duration: Duration(seconds: 1), curve: Curves.easeIn);
    alternativa1 = false;
    alternativa2 = false;
    alternativa3 = false;
    alternativa4 = false;
  }

  Future getRanking(UserModel userModelConst) async {
    final getUserFromFirebase =
        await firestore.collection("users").doc(userModelConst.id).get();
    final userModel = UserModel.fromFirebase(getUserFromFirebase);
    final totalQuestoes = userModel.acertos! + userModel.erros!;
    ranking = userModel.acertos! / totalQuestoes * 100;
    notifyListeners();
  }

  definirRanking<String>(double porcentagemRanking) {
    //retornar o caminho da imagem
    if (porcentagemRanking < 20.0) {
      return "assets/FERRO.png";
    } else if (porcentagemRanking < 40.0) {
      return "assets/BRONZE.png";
    } else if (porcentagemRanking < 60.0) {
      return "a";
    } else if (porcentagemRanking < 70.0) {
      return "assets/OURO.png";
    } else if (porcentagemRanking < 80.0) {
      return "assets/PLATINA.png";
    } else if (porcentagemRanking < 100.0) {
      return "assets/DIMA.png";
    } else {
      return "assets/DIMA.png";
    }
  }
}
