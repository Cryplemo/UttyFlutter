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
          backgroundColor: secondaryColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.home,
                  size: 50,
                  color: terciaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/init');
                },
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.settings_sharp,
                  size: 50,
                  color: terciaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    "profile",
                  );
                },
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.account_circle,
                  size: 50,
                  color: terciaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    "profile",
                  );
                },
              ),
              label: "",
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
                        onPressed: () {
                          Navigator.of(context).pushNamed('/menu');
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
                        onPressed: () {
                          Navigator.of(context).pushNamed('/menu');
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
                      onPressed: () {
                        Navigator.of(context).pushNamed('/menu');
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
