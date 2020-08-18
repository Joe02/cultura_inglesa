import 'package:cultura_inglesa/utils/custom_form_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginScreenPage extends StatefulWidget {
  final goToPage;

  LoginScreenPage(this.goToPage);

  @override
  LoginScreenPageState createState() => LoginScreenPageState();
}

class LoginScreenPageState extends State<LoginScreenPage> {
  var userInput = "";
  var passwordInput = "";

  void updateUserInput(String updatedValue) {
    setState(() {
      userInput = updatedValue;
    });
  }

  void updatePasswordInput(String updatedValue) {
    setState(() {
      passwordInput = "";
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
              horizontal: MediaQuery
                  .of(context)
                  .size
                  .width / 5,
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
                  SizedBox(height: 10,),
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
                    Icons.lock,
                    "Password",
                    updatePasswordInput,
                  ),
                  buildForgotPasswordOption(),
                  buildSubmitButton(),
                  buildRegisterOption(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildForgotPasswordOption() {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          widget.goToPage("passwordReset");
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 15.0, top: 15.0, bottom: 5.0),
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
                    "Continuar",
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

  buildRegisterOption() {
    return InkWell(
      onTap: () {
        //TODO Navigate to Register page
      },
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: GestureDetector(
            onTap: () {
              widget.goToPage("Register");
            },
            child: RichText(
              text: TextSpan(
                text: "Não possui uma conta?",
                style: TextStyle(fontSize: 17, color: Colors.grey[800]),
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
    );
  }

  onSubmit() {
    var error = "";
    bool emailValidation;
    if (emailValidation = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(userInput) == false) {
      error = "Email inválido.";
    } else if (passwordInput.length < 6) {
      error = "A senha deve conter mais de 6 caracteres.";
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
