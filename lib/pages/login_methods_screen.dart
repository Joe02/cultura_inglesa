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
        _pageViewController.animateTo(0, duration: Duration(milliseconds: 400), curve: Curves.linear);
      }
      break;
      case "Login": {
        _pageViewController.animateTo(1, duration: Duration(milliseconds: 400), curve: Curves.linear);
      }
      break;
      case "Register": {
        _pageViewController.animateTo(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
      }
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Container(
                child: FlutterLogo(
                  size: 200,
                )),
          ),
          Expanded(
            child: PageView(
              controller: _pageViewController,
              children: <Widget>[
                PasswordResetPage(),
                LoginScreenPage(),
                RegisterScreenPage()
              ],
            ),
          ),
        ],
      ),
    );
  }
}