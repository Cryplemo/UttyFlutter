import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utty_flutter/init.dart';
import 'package:utty_flutter/login.dart';
import 'package:utty_flutter/menu.dart';
import 'package:utty_flutter/model/user/user_manager.dart';
import 'package:utty_flutter/profile.dart';
import 'package:utty_flutter/sign.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/sign': (context) => SignPage(),
            '/init': (context) => InitPage(),
            '/menu': (context) => MenuPage(),
            '/profile': (context) => ProfilePage(),
          }),
    );
  }
}
