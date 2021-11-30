import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
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
                  Navigator.of(context).pushNamed('/menu');
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
                  Navigator.of(context).pushNamed('/menu');
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
                          Navigator.of(context).pushNamed('/init');
                        },
                        child: Text(
                          "Questoes",
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
                          Navigator.of(context).pushNamed('/');
                        },
                        child: Text(
                          "Estatisticas",
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
                        onPressed: () {
                          Navigator.of(context).pushNamed('/init');
                        },
                        child: Text(
                          "Disciplinas",
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
                        "Meu Ranking",
                        style: TextStyle(
                            fontFamily: "Aldo", fontSize: 40, color: QuadColor),
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
