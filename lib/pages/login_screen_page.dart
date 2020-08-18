import 'package:cultura_inglesa/utils/custom_form_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginScreenPage extends StatefulWidget {
  @override
  LoginScreenPageState createState() => LoginScreenPageState();
}

class LoginScreenPageState extends State<LoginScreenPage> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  var _obscurePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 5,
            ),
            child: Card(
              color: Colors.grey[100],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Column(
                children: <Widget>[
                  CustomFormInput("Usuário", "Digite seu usuário",
                      Icons.supervised_user_circle, "Text"),
                  CustomFormInput("Senha", "Digite sua senha",
                      Icons.lock, "Password"),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 15.0, top: 15.0, bottom: 5.0),
                      child: Text(
                        "Esqueceu sua senha?",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.blue[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: RaisedButton(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              color: Colors.blueAccent,
                              onPressed: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  "Continuar",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      letterSpacing: 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //TODO Navigate to Register page
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: RichText(
                          text: TextSpan(
                            text: "Não possui uma conta?",
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey[800]),
                            children: <TextSpan>[
                              TextSpan(
                                  text: " Crie uma agora!",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
