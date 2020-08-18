import 'package:cultura_inglesa/utils/custom_form_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreenPage extends StatefulWidget {
  @override
  RegisterScreenPageState createState() => RegisterScreenPageState();
}

class RegisterScreenPageState extends State<RegisterScreenPage> {
  var userInput = "";
  var passwordInput = "";
  var passwordConfirmationInput = "";

  void updateUserInput(String updatedValue) {
    setState(() {
      userInput = updatedValue;
    });
  }

  void updatePasswordInput(String updatedValue) {
    setState(() {
      passwordInput = updatedValue;
    });
  }

  void updatePasswordConfirmationInput(String updatedValue) {
    setState(() {
      passwordConfirmationInput = updatedValue;
    });
  }

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
              elevation: 5,
              color: Colors.grey[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Column(
                children: <Widget>[
                  CustomFormInput(
                      "Usuário",
                      "Digite seu usuário",
                      Icons.supervised_user_circle,
                      "Text",
                      updateUserInput
                  ),
                  CustomFormInput(
                      "Senha",
                      "Digite sua senha",
                      Icons.lock_outline,
                      "Password",
                      updatePasswordInput
                  ),
                  CustomFormInput(
                      "Confirmação",
                      "Confirme sua senha",
                      Icons.lock,
                      "Password",
                      updatePasswordConfirmationInput
                  ),
                  buildSubmitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: RaisedButton(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                color: Colors.blueAccent,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "Confirmar",
                    style: TextStyle(
                        color: Colors.white, fontSize: 20, letterSpacing: 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}