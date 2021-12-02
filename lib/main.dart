// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utty_flutter/model/questoes/questao_manager.dart';
import 'package:utty_flutter/profile.dart';
import 'package:utty_flutter/ranking.dart';

import 'package:utty_flutter/sign.dart';
import 'package:utty_flutter/init.dart';
import 'package:utty_flutter/login.dart';
import 'package:utty_flutter/questoes_page.dart';

import 'model/user/user_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const InitialPage());
}

Widget verificarUsuarioLogado() {
  final auth = FirebaseAuth.instance;
  if (auth.currentUser != null) {
    return InitPage();
  } else {
    return LoginPage();
  }
}

class InitialPage extends StatelessWidget {
  const InitialPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => QuestaoManager(),
          //lazy: false,
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: verificarUsuarioLogado(),
          onGenerateRoute: (settings) {
            final args = settings.arguments;
            switch (settings.name) {
              case 'login':
                return MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                );
              case 'cadastro':
                return MaterialPageRoute(
                  builder: (context) => const SignPage(),
                );
              case 'profile':
                return MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                );
              case 'ranking':
                return MaterialPageRoute(
                  builder: (context) => const RankingPage(),
                );
              case 'questoes':
                return MaterialPageRoute(builder: (context) {
                  QuestoesPage questoes = args as QuestoesPage;
                  return QuestoesPage(questoes: questoes.questoes);
                });
              case 'init':
              default:
                return MaterialPageRoute(
                    builder: (context) => const InitPage());
            }
          }),
    );
  }
}
