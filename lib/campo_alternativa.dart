import 'package:flutter/material.dart';
import 'package:utty_flutter/color.dart';

class CampoAlternativa extends StatelessWidget {
  const CampoAlternativa(
      {Key? key, required this.alternativa, this.selecionado})
      : super(key: key);
  final String? alternativa;
  final bool? selecionado;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: selecionado!
            ? CoresAplicativo.terciaryColor
            : CoresAplicativo.secondaryColor,
      ),
      margin: EdgeInsets.all(4),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          alternativa!,
          style: TextStyle(
              fontFamily: "Arvo",
              color: selecionado! ? Colors.black : CoresAplicativo.cinzaColor),
        ),
      ),
    );
  }
}
