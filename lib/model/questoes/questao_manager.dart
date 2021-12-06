import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utty_flutter/color.dart';
import 'package:utty_flutter/global_dialog.dart';
import 'package:utty_flutter/model/questoes/questao.dart';
import 'package:utty_flutter/model/user/user.dart';

class QuestaoManager extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Questao> questoes = [];
  List<Questao> questosFromFirebase = [];
  final PageController _pageController = PageController(keepPage: false);
  PageController get pageController => _pageController;
  int? questaoSelecionada;
  get context => null;
  double ranking = 0.0;
  int currentIndex = 0;

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
    final random = Random();
    final docs = await firestore.collection("Matematica").get();
    questoes = [];
    questosFromFirebase = [];
    docs.docs.forEach((questao) {
      questosFromFirebase.add(Questao.fromDocumentSnapshot(questao));
    });
    questosFromFirebase.forEach((questaoo) {
      questoes
          .add(questosFromFirebase[random.nextInt(questosFromFirebase.length)]);
    });
  }

  Future<void> getQuestoesQuimica() async {
    final random = Random();
    final docs = await firestore.collection("Quimica").get();
    questoes = [];
    questosFromFirebase = [];
    docs.docs.forEach((questao) {
      questosFromFirebase.add(Questao.fromDocumentSnapshot(questao));
    });
    questosFromFirebase.forEach((questaoo) {
      questoes
          .add(questosFromFirebase[random.nextInt(questosFromFirebase.length)]);
    });
  }

  Future<void> getQuestoesBiologia() async {
    final random = Random();
    final docs = await firestore.collection("Biologia").get();
    questoes = [];
    questosFromFirebase = [];
    docs.docs.forEach((questao) {
      questosFromFirebase.add(Questao.fromDocumentSnapshot(questao));
    });
    questosFromFirebase.forEach((questaoo) {
      questoes
          .add(questosFromFirebase[random.nextInt(questosFromFirebase.length)]);
    });
  }

  Future<void> getQuestoesFisica() async {
    final random = Random();
    final docs = await firestore.collection("Fisica").get();
    questoes = [];
    questosFromFirebase = [];
    docs.docs.forEach((questao) {
      questosFromFirebase.add(Questao.fromDocumentSnapshot(questao));
    });
    questosFromFirebase.forEach((questaoo) {
      questoes
          .add(questosFromFirebase[random.nextInt(questosFromFirebase.length)]);
    });
  }

  Future<void> verificarResposta(int respostaSelecionada, int respostaCorreta,
      BuildContext buildContext, UserModel userModel, String resolucao) async {
    if (respostaSelecionada == respostaCorreta) {
      CustomDialogs.dialogSucesso(buildContext, resolucao);
      await incrementarAcerto(userModel);
    } else {
      CustomDialogs.dialogErro(buildContext, resolucao);
      await incrementarErro(userModel);
    }
  }

  Future<void> incrementarAcerto(UserModel userModelConst) async {
    final getUserFromFirebase =
        await firestore.collection("users").doc(userModelConst.id).get();
    final userModel = UserModel.fromFirebase(getUserFromFirebase);
    var numeroAcertos = userModel.acertos!;
    final novoNumeroAcertos = numeroAcertos + 1;
    await firestore
        .collection("users")
        .doc(userModel.id)
        .update({"acertos": novoNumeroAcertos});
  }

  Future<int> incrementarErro(UserModel userModelConst) async {
    final getUserFromFirebase =
        await firestore.collection("users").doc(userModelConst.id).get();
    final userModel = UserModel.fromFirebase(getUserFromFirebase);
    var numeroErros = userModel.erros!;
    final novoNumeroErros = numeroErros + 1;
    await firestore
        .collection("users")
        .doc(userModel.id)
        .update({"erros": novoNumeroErros});

    return novoNumeroErros;
  }

  void proximaPergunta(int lastPage, BuildContext context) {
    if (pageController.page == lastPage) {
      print("Chegou a ultima pagina");

      Navigator.of(context).pushNamed(
        "init",
      );
      CustomDialogs.dialogUltimaPagina(context);
      //Exibir dialog avisando que chegou ao final das perguntas
    }
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
    if (userModel.acertos! == 0 && userModel.erros! == 0) {
      ranking = 0.0;
      notifyListeners();
      return;
    }
    final totalQuestoes = userModel.acertos! + userModel.erros!;
    ranking = userModel.acertos! / totalQuestoes * 100;
    notifyListeners();
  }

  Color getColorRanking(double ranking) {
    if (ranking < 20.0) {
      //Cor Ferro
      return CoresAplicativo.FerroColor;
    } else if (ranking < 40.0) {
      //Cor Bronze
      return CoresAplicativo.BronzeColor;
    } else if (ranking < 60.0) {
      //Cor Prata
      return CoresAplicativo.PrataColor;
    } else if (ranking < 70.0) {
      //Cor Ouro
      return CoresAplicativo.GoldColor;
    } else if (ranking < 80.0) {
      //Cor Platina
      return CoresAplicativo.PlatColor;
    }
    //Cor Diamante
    return CoresAplicativo.DimaColor;
  }

  definirRanking<String>(double porcentagemRanking) {
    //retornar o caminho da imagem
    if (porcentagemRanking < 20.0) {
      return "assets/FERRO.png";
    } else if (porcentagemRanking < 40.0) {
      return "assets/BRONZE.png";
    } else if (porcentagemRanking < 60.0) {
      return "assets/PRATA.png";
    } else if (porcentagemRanking < 70.0) {
      return "assets/OURO.png";
    } else if (porcentagemRanking < 80.0) {
      return "assets/PLATINA.png";
    } else if (porcentagemRanking < 100.0) {
      return "assets/DIMA.png";
    } else {
      return "assets/FERRO.png";
    }
  }
}
