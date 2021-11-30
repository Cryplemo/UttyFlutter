import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utty_flutter/model/user/user_manager.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginPage> {
  bool _obscureText = true;
  final primaryColor = Color(0xffDEDEDE);
  final secondaryColor = Color(0xff474746);
  final terciaryColor = Color(0xffFA963B);
  final QuadColor = Color(0xff46B8FC);
  final cinzaColor = Color(0xffB6B6B6);
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: SingleChildScrollView(child: Consumer<UserManager>(
                builder: (_, userManager, __) {
                  return Form(
                    key: _keyForm,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Image.asset("assets/logo.png"),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onSaved: (email) {
                            userManager.userModel.email = email;
                          },
                          controller: _controllerEmail,
                          decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(color: cinzaColor),
                              fillColor: Colors.white70,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          onSaved: (senha) {
                            userManager.userModel.senha = senha;
                          },
                          controller: _controllerSenha,
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              hintText: "Senha",
                              hintStyle: TextStyle(color: cinzaColor),
                              fillColor: Colors.white70,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8))),
                          obscureText: _obscureText,
                        ),
                        SizedBox(
                          height: 40,
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
                            _keyForm.currentState!.save();
                            await userManager.logarUsuario(
                                userManager.userModel.email!,
                                userManager.userModel.senha!, onSuccess: () {
                              Navigator.of(context).pushNamed('/init');
                            }, onFail: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title:
                                          Text("                        Erro"),
                                      content: Text(
                                          "Ocorreu um erro no login, verifique suas informações ou utilize outro email."),
                                    );
                                  });
                            });
                          },
                          child: Text(
                            "Acessar",
                            style: TextStyle(
                                fontFamily: "Aldo",
                                fontSize: 40,
                                color: terciaryColor),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          "assets/ou.png",
                        ),
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
                            Navigator.of(context).pushNamed('/sign');
                          },
                          child: Text(
                            "Crie sua conta",
                            style: TextStyle(
                                fontFamily: "Aldo",
                                fontSize: 40,
                                color: QuadColor),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )),
            )
          ],
        ));
  }
}
