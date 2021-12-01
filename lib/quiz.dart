import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utty_flutter/model/user/user_manager.dart';

import 'model/questoes/questao.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget activeIcon;
    final List<Questao>? questoes;
    const primaryColor = Color(0xffDEDEDE);
    const secondaryColor = Color(0xff474746);
    const terciaryColor = Color(0xffFA963B);
    const QuadColor = Color(0xff46B8FC);
    const cinzaColor = Color(0xffB6B6B6);

    return Scaffold(
        backgroundColor: primaryColor,
        body: Stack(
          children: [
            BackButton(
              color: Colors.black,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/background.png"))),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 300,
                      child: Text(
                        "Em um determinado ano, os computadores da receita federal de um país identificaram como inconsistentes 20% das declarações de imposto de renda que lhe foram encaminhadas. Uma declaração é classificada como inconsistente quando apresenta algum tipo de erro ou conflito nas informações prestadas. Essas declarações consideradas inconsistentes foram analisadas pelos auditores, que constataram que 25% delas eram fraudulentas. Constatou-se ainda que, dentre as declarações que não apresentaram inconsistências, 6,25% eram fraudulentas. Qual é a probabilidade de, nesse ano, a declaração de um contribuinte ser considerada inconsistente, dado que ela era fraudulenta?",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Arvo",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(TextStyle(
                                fontSize: 15,
                                fontFamily: "Arvo",
                                color: terciaryColor)),
                            backgroundColor:
                                MaterialStateProperty.all(secondaryColor),
                            minimumSize:
                                MaterialStateProperty.all(Size(350, 62))),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/init');
                        },
                        child: Text(
                          "",
                          style: TextStyle(
                              fontFamily: "Arvo",
                              fontSize: 15,
                              color: Colors.white),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(
                                TextStyle(fontSize: 15, fontFamily: "Arvo")),
                            backgroundColor:
                                MaterialStateProperty.all(secondaryColor),
                            minimumSize:
                                MaterialStateProperty.all(Size(350, 62))),
                        onPressed: () {},
                        child: Text(
                          "",
                          style: TextStyle(
                              fontFamily: "Arvo",
                              fontSize: 15,
                              color: Colors.white),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(
                                TextStyle(fontSize: 40, fontFamily: "Aldo")),
                            backgroundColor:
                                MaterialStateProperty.all(secondaryColor),
                            minimumSize:
                                MaterialStateProperty.all(Size(350, 62))),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/init');
                        },
                        child: Text(
                          "",
                          style: TextStyle(
                              fontFamily: "Aldo",
                              fontSize: 15,
                              color: Colors.white),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 15, fontFamily: "Aldo")),
                          backgroundColor:
                              MaterialStateProperty.all(secondaryColor),
                          minimumSize:
                              MaterialStateProperty.all(Size(350, 62))),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/init');
                      },
                      child: Text(
                        "",
                        style: TextStyle(
                          fontFamily: "Aldo",
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
