import 'package:flutter/material.dart';

class CustomDialogs {
  static void dialogSucesso(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return const AlertDialog(
          title: Text("      Alternativa correta!"),
          content: Text(""),
        );
      },
    );
  }

  static void dialogErro(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return const AlertDialog(
          title: Text("    Alternativa incorreta!"),
          content: Text(""),
        );
      },
    );
  }
}
