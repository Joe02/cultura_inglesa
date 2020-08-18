import 'package:cultura_inglesa/utils/custom_form_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordResetPage extends StatefulWidget {
  final goToPage;
  PasswordResetPage(this.goToPage);

  @override
  PasswordResetPageState createState() => PasswordResetPageState();
}

class PasswordResetPageState extends State<PasswordResetPage> {
  var emailInput = "";

  void updateUserEmailInput(String updatedValue) {
    setState(() {
      emailInput = updatedValue;
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
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10,),
                      CustomFormInput(
                        "",
                        "Digite seu e-mail",
                        Icons.email,
                        "Text",
                        updateUserEmailInput,
                      ),
                      buildSubmitButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  widget.goToPage("Login");
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.chevron_right, size: 50, color: Colors.white,),
                      Text("Voltar", style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ))
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
                color: Colors.blue,
                onPressed: () {
                  onSubmit();
                  },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "Enviar",
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
    if (emailValidation = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailInput) == false) {
      error = "Email inválido.";
    }

    if (error.isNotEmpty) {
      Scaffold.of(context).hideCurrentSnackBar();
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(error),
        duration: Duration(seconds: 4),
      ));
    } else {
      Scaffold.of(context).hideCurrentSnackBar();
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Um email com instruções para a mudança de senha foi enviado!"),
        duration: Duration(seconds: 4),
      ));
      widget.goToPage("Login");
    }
  }
}
