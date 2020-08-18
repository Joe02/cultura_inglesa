import 'package:cultura_inglesa/utils/custom_form_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreenPage extends StatefulWidget {
  final goToPage;

  RegisterScreenPage(this.goToPage);

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
      body: Stack(
        children: <Widget>[
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 5,
                ),
                child: Card(
                  elevation: 5,
                  color: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.0, color: Colors.grey[700]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      CustomFormInput(
                        "",
                        "Digite seu usuário",
                        Icons.supervised_user_circle,
                        "Text",
                        updateUserInput,
                      ),
                      CustomFormInput(
                        "",
                        "Digite sua senha",
                        Icons.lock_outline,
                        "Password",
                        updatePasswordInput,
                      ),
                      CustomFormInput(
                        "",
                        "Confirme sua senha",
                        Icons.lock,
                        "Password",
                        updatePasswordConfirmationInput,
                      ),
                      buildSubmitButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                widget.goToPage("Login");
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.chevron_left,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      "Voltar",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
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
                onPressed: () {
                  onSubmit();
                },
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

  onSubmit() {
    var error = "";
    bool emailValidation;
    if (emailValidation =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(userInput) ==
            false) {
      error = "Email inválido.";
    } else if (passwordInput.length < 6) {
      error = "A senha deve conter mais de 6 caracteres.";
    } else if (passwordConfirmationInput.length < 6) {
      error = "A confirmação deve conter mais de 6 caracteres.";
    } else {
      error = "As senhas devem coincidir.";
    }

    if (error.isNotEmpty) {
      Scaffold.of(context).hideCurrentSnackBar();
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(error),
        duration: Duration(seconds: 4),
      ));
    }
  }
}
