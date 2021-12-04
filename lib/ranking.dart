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
        backgroundColor: CoresAplicativo.primaryColor,
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontSize: 0),
          backgroundColor: CoresAplicativo.secondaryColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: IconButton(
                //padding: EdgeInsets.zero,
                iconSize: 60,
                icon: Icon(
                  Icons.home,
                  color: CoresAplicativo.terciaryColor,
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
                  color: CoresAplicativo.terciaryColor,
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
                  color: CoresAplicativo.terciaryColor,
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
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                "Meu Ranking",
                                style: TextStyle(
                                    fontFamily: "Aldo",
                                    fontSize: 50,
                                    color: CoresAplicativo.terciaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            questaoManager.definirRanking(
                              questaoManager.ranking,
                            ),
                            height: 100,
                            width: 180,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "${questaoManager.ranking.toStringAsFixed(2)} %",
                            style: TextStyle(
                              fontFamily: "Aldo",
                              fontSize: 45,
                              color: questaoManager
                                  .getColorRanking(questaoManager.ranking),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image(
                      image: AssetImage("assets/rankings.png"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
