import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utty_flutter/color.dart';
import 'package:utty_flutter/model/questoes/questao_manager.dart';
import 'package:utty_flutter/model/user/user_manager.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  @override
  void initState() {
    // TODO: implement initState
    final questaoManager = context.read<QuestaoManager>();
    final userManager = context.read<UserManager>();
    questaoManager.getRanking(userManager.userModel);
  }

  @override
  Widget build(BuildContext context) {
    final questaoManager = context.watch<QuestaoManager>();
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: CoresAplicativo.secondaryColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.home,
                  size: 50,
                  color: CoresAplicativo.terciaryColor,
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
                  Icons.emoji_events_rounded,
                  size: 50,
                  color: CoresAplicativo.terciaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    "ranking",
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
                  color: CoresAplicativo.terciaryColor,
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
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "⠀⠀ Meu Ranking",
                      style: TextStyle(
                          fontFamily: "Aldo",
                          fontSize: 50,
                          color: CoresAplicativo.terciaryColor),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(questaoManager.definirRanking(
                        questaoManager.ranking,
                      ))),
                    ),
                  ),
                  Text(
                    "${questaoManager.ranking.toStringAsFixed(2)} %",
                    style: TextStyle(fontFamily: "Aldo", fontSize: 40),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Text(
                    "Porcentagem de acerto necessaria para cada ranque.",
                    style: TextStyle(
                        fontFamily: "Aldo",
                        fontSize: 30,
                        color: CoresAplicativo.secondaryColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
