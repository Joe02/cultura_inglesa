import 'package:cultura_inglesa/pages/login_screen_page.dart';
import 'package:cultura_inglesa/pages/password_reset_page.dart';
import 'package:cultura_inglesa/pages/register_screen_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginMethodsScreen extends StatefulWidget {
  @override
  LoginMethodsScreenState createState() => LoginMethodsScreenState();
}

class LoginMethodsScreenState extends State<LoginMethodsScreen> {
  final _pageViewController = PageController(initialPage: 1);

  goToPage(String page) {
    switch(page){
      case "passwordReset": {
        _pageViewController.animateToPage(0, duration: Duration(milliseconds: 1000), curve: Curves.decelerate);
      }
      break;
      case "Login": {
        _pageViewController.animateToPage(1, duration: Duration(milliseconds: 1000), curve: Curves.decelerate);
      }
      break;
      case "Register": {
        _pageViewController.animateToPage(2, duration: Duration(milliseconds: 1000), curve: Curves.decelerate);
      }
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    ///TODO Open help menu.
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50, top: 50,),
                    child: Icon(Icons.info, size: 30, color: Colors.white,),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Container(
                          child: FlutterLogo(
                            size: 200,
                          )),
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageViewController,
                      children: <Widget>[
                        PasswordResetPage(goToPage),
                        LoginScreenPage(goToPage),
                        RegisterScreenPage(goToPage)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}