import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utty_flutter/model/questoes/questao.dart';
import 'package:utty_flutter/model/questoes/questao_manager.dart';
import 'package:utty_flutter/questoes_page.dart';
import 'Quiz.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xffDEDEDE);
    final secondaryColor = Color(0xff474746);
    final terciaryColor = Color(0xffFA963B);
    final QuadColor = Color(0xff46B8FC);
    final cinzaColor = Color(0xffB6B6B6);
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontSize: 0),
          backgroundColor: secondaryColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: IconButton(
                //padding: EdgeInsets.zero,
                iconSize: 60,
                icon: Icon(
                  Icons.home,
                  color: terciaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/init');
                },
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                //padding: EdgeInsets.zero,
                iconSize: 60,
                icon: Icon(
                  Icons.emoji_events_rounded,
                  color: terciaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    "ranking",
                  );
                },
              ),
              label: "Ranking",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                //padding: EdgeInsets.zero,
                iconSize: 60,
                icon: Icon(
                  Icons.account_circle,
                  color: terciaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    "profile",
                  );
                },
              ),
              label: "Perfil",
            ),
          ],
        ),
        backgroundColor: primaryColor,
        body: Stack(
          children: [
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
                    Image.asset(
                      "assets/logo.png",
                      width: 220,
                      height: 90,
                    ),
                    Text("Escolha a disciplina:",
                        style: TextStyle(
                          fontFamily: "Arvo",
                          fontSize: 30,
                          color: QuadColor,
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(
                                TextStyle(fontSize: 30)),
                            backgroundColor:
                                MaterialStateProperty.all(secondaryColor),
                            minimumSize:
                                MaterialStateProperty.all(Size(350, 62))),
                        onPressed: () async {
                          final questaoManager = Provider.of<QuestaoManager>(
                              context,
                              listen: false);
                          await questaoManager.getQuestoesMatematica();
                          Navigator.of(context).pushNamed(
                            "questoes",
                            arguments: QuestoesPage(
                              questoes: questaoManager.questoes,
                            ),
                          );
                        },
                        child: Image.asset("assets/MATH.png")),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            alignment: Alignment.centerLeft,
                            textStyle: MaterialStateProperty.all(
                                TextStyle(fontSize: 30)),
                            backgroundColor:
                                MaterialStateProperty.all(secondaryColor),
                            minimumSize:
                                MaterialStateProperty.all(Size(350, 62))),
                        onPressed: () async {
                          final questaoManager = Provider.of<QuestaoManager>(
                              context,
                              listen: false);
                          await questaoManager.getQuestoesFisica();
                          Navigator.of(context).pushNamed(
                            "questoes",
                            arguments: QuestoesPage(
                              questoes: questaoManager.questoes,
                            ),
                          );
                        },
                        child: Image.asset("assets/FIS.png")),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(
                                TextStyle(fontSize: 30)),
                            backgroundColor:
                                MaterialStateProperty.all(secondaryColor),
                            minimumSize:
                                MaterialStateProperty.all(Size(350, 62))),
                        onPressed: () async {
                          final questaoManager = Provider.of<QuestaoManager>(
                              context,
                              listen: false);
                          await questaoManager.getQuestoesQuimica();
                          Navigator.of(context).pushNamed(
                            "questoes",
                            arguments: QuestoesPage(
                              questoes: questaoManager.questoes,
                            ),
                          );
                        },
                        child: Image.asset("assets/QUIM.png")),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 30)),
                          backgroundColor:
                              MaterialStateProperty.all(secondaryColor),
                          minimumSize:
                              MaterialStateProperty.all(Size(350, 62))),
                      onPressed: () async {
                        final questaoManager =
                            Provider.of<QuestaoManager>(context, listen: false);
                        await questaoManager.getQuestoesBiologia();
                        Navigator.of(context).pushNamed(
                          "questoes",
                          arguments: QuestoesPage(
                            questoes: questaoManager.questoes,
                          ),
                        );
                      },
                      child: Image.asset("assets/BIO.png"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
