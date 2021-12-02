import 'package:flutter/material.dart';

class CustomDialogs {
  static void dialogSucesso(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return const AlertDialog(
          title: Text("      Alternativa correta!",
              style: TextStyle(fontFamily: "Aldo", color: Colors.green)),
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
          title: Text(
            "    Alternativa incorreta!",
            style: TextStyle(fontFamily: "Aldo", color: Colors.red),
          ),
          content: Text(""),
        );
      },
    );
  }
}
