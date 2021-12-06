import 'package:flutter/material.dart';

class CustomDialogs {
  static get questaoManager => null;

  static void dialogSucesso(BuildContext context, String resolucao) {
    showDialog(
      context: context,
      builder: (_) {
        var widget;
        return AlertDialog(
          title: Text("      Alternativa correta!",
              style: TextStyle(fontFamily: "Aldo", color: Colors.green)),
          content: Text("Resolucao: $resolucao"),
          actions: [],
        );
      },
    );
  }

  static void dialogErro(BuildContext context, String resolucao) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            "    Alternativa incorreta!",
            style: TextStyle(fontFamily: "Aldo", color: Colors.red),
          ),
          content: Text("Resolucao: $resolucao"),
        );
      },
    );
  }

  static void dialogUltimaPagina(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return const AlertDialog(
          actions: [],
          title: Text(
            "Voce chegou a ultima pagina",
            style: TextStyle(fontFamily: "Aldo", color: Colors.red),
          ),
          content: Text(""),
        );
      },
    );
  }
}
