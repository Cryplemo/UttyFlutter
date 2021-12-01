import 'package:flutter/material.dart';

class CustomDialogs {
  static void dialogSucesso(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return const AlertDialog(
          title: Text("Sucesso"),
          content: Text("Sucesso"),
        );
      },
    );
  }

  static void dialogErro(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return const AlertDialog(
          title: Text("Erro"),
          content: Text("Erro"),
        );
      },
    );
  }
}
