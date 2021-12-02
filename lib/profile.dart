import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utty_flutter/color.dart';
import 'package:utty_flutter/model/user/user_manager.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Widget activeIcon;
    const primaryColor = Color(0xffDEDEDE);
    const secondaryColor = Color(0xff474746);
    const terciaryColor = Color(0xffFA963B);
    const QuadColor = Color(0xff46B8FC);
    const cinzaColor = Color(0xffB6B6B6);

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
                  Navigator.of(context).pushNamed(
                    "init",
                  );
                },
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.emoji_events_rounded,
                  size: 50,
                  color: terciaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('ranking');
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
                  Navigator.of(context).pushNamed('/profile');
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
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "assets/logo.png",
                      width: 250,
                      height: 120,
                    ),
                    Consumer<UserManager>(builder: (_, userManager, __) {
                      return Text(
                        userManager.emailUsuario() ?? "",
                        style: TextStyle(
                          fontFamily: "Arvo",
                          fontSize: 40,
                          color: QuadColor,
                        ),
                      );
                    }),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(TextStyle(
                                fontSize: 40,
                                fontFamily: "Aldo",
                                color: terciaryColor)),
                            backgroundColor:
                                MaterialStateProperty.all(secondaryColor),
                            minimumSize:
                                MaterialStateProperty.all(Size(350, 62))),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor:
                                      CoresAplicativo.secondaryColor,
                                  title: Text("Sobre nos",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Aldo",
                                        color: CoresAplicativo.terciaryColor,
                                      )),
                                  content: Text(
                                    "Somos uma organização que prioriza a educação, mentalidade e o futuro de nossos apoiadores, sempre estaremos à disposição para auxiliá-los nos momentos mais angustiantes.",
                                    style: TextStyle(
                                        color: CoresAplicativo.terciaryColor,
                                        fontFamily: "Arvo"),
                                  ),
                                );
                              });
                        },
                        child: Text(
                          "Sobre",
                          style: TextStyle(
                              fontFamily: "Aldo",
                              fontSize: 40,
                              color: terciaryColor),
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
                          "Avalie-nos",
                          style: TextStyle(
                              fontFamily: "Aldo",
                              fontSize: 40,
                              color: QuadColor),
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
                        onPressed: () async {
                          final userManager =
                              Provider.of<UserManager>(context, listen: false);
                          userManager.logout(context);
                        },
                        child: Text(
                          "Sair",
                          style: TextStyle(
                              fontFamily: "Aldo",
                              fontSize: 40,
                              color: terciaryColor),
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
                        "Questoes Respondidas",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Aldo",
                          fontSize: 35,
                          color: QuadColor,
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
