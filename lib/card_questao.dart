import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utty_flutter/color.dart';
import 'package:utty_flutter/model/questoes/questao.dart';
import 'package:utty_flutter/model/questoes/questao_manager.dart';
import 'package:utty_flutter/campo_alternativa.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:utty_flutter/model/user/user_manager.dart';

class CardQuestao extends StatefulWidget {
  const CardQuestao({Key? key, required this.questao}) : super(key: key);
  final Questao? questao;

  @override
  State<CardQuestao> createState() => _CardQuestaoState();
}

class _CardQuestaoState extends State<CardQuestao> {
  final primaryColor = Color(0xffDEDEDE);
  final secondaryColor = Color(0xff474746);
  final terciaryColor = Color(0xffFA963B);
  final QuadColor = Color(0xff46B8FC);
  final cinzaColor = Color(0xffB6B6B6);
  final azulColor = Color(0xff2997D9);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: primaryColor,
            body: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/background.png"))),
              ),
              Positioned(
                height: 100,
                child: BackButton(
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(child: Consumer<QuestaoManager>(
                    builder: (_, questaoManager, __) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          LinearPercentIndicator(
                              linearGradient: LinearGradient(colors: [
                                CoresAplicativo.terciaryColor,
                                CoresAplicativo.QuadColor,
                              ]),
                              animation: true,
                              animationDuration: 100000,
                              lineHeight: 30,
                              alignment: MainAxisAlignment.end,
                              width: MediaQuery.of(context).size.width * 0.7,
                              percent: 1.0,
                              backgroundColor: CoresAplicativo.secondaryColor,
                              onAnimationEnd: () {
                                questaoManager.proximaPergunta();
                                final userManager = Provider.of<UserManager>(
                                    context,
                                    listen: false);
                                questaoManager
                                    .incrementarErro(userManager.userModel);
                              },
                              trailing: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Image(
                                  image: AssetImage(
                                    "assets/Clock.gif",
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              widget.questao!.questao!,
                              style: TextStyle(
                                fontFamily: "Arvo",
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            focusColor: QuadColor,
                            onTap: () {
                              questaoManager
                                  .verificarOutrasAlternativasSelecionadas(1);
                            },
                            child: CampoAlternativa(
                              alternativa: widget.questao!.alternativa1!,
                              selecionado: questaoManager.alternativa1,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              questaoManager
                                  .verificarOutrasAlternativasSelecionadas(2);
                            },
                            child: CampoAlternativa(
                              alternativa: widget.questao!.alternativa2!,
                              selecionado: questaoManager.alternativa2,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              questaoManager
                                  .verificarOutrasAlternativasSelecionadas(3);
                            },
                            child: CampoAlternativa(
                              alternativa: widget.questao!.alternativa3!,
                              selecionado: questaoManager.alternativa3,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              questaoManager
                                  .verificarOutrasAlternativasSelecionadas(4);
                            },
                            child: CampoAlternativa(
                              alternativa: widget.questao!.alternativa4!,
                              selecionado: questaoManager.alternativa4,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(secondaryColor),
                                minimumSize:
                                    MaterialStateProperty.all(Size(250, 50))),
                            onPressed: () {
                              final userManager = Provider.of<UserManager>(
                                  context,
                                  listen: false);
                              questaoManager.verificarResposta(
                                  questaoManager.questaoSelecionada,
                                  widget.questao!.numeroResposta!,
                                  context,
                                  userManager.userModel);
                              questaoManager.proximaPergunta();
                            },
                            child: Text("Confirmar",
                                style: TextStyle(
                                    fontFamily: "Aldo",
                                    fontSize: 30,
                                    color: terciaryColor)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(secondaryColor),
                                minimumSize:
                                    MaterialStateProperty.all(Size(250, 50))),
                            onPressed: () {
                              questaoManager.proximaPergunta();
                            },
                            child: Text("Pular Questao",
                                style: TextStyle(
                                    fontFamily: "Aldo",
                                    fontSize: 30,
                                    color: QuadColor)),
                          ),
                        ],
                      );
                    },
                  )),
                ),
              )
            ])));
  }
}
