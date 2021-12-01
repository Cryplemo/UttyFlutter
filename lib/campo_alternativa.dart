import 'package:flutter/material.dart';

class CampoAlternativa extends StatelessWidget {
  const CampoAlternativa({ Key? key,required this.alternativa,this.selecionado }) : super(key: key);
  final String? alternativa;
  final bool? selecionado;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      color: selecionado! ? Colors.red : Colors.grey[300],
      child: Text(alternativa!),
    );
  }
}