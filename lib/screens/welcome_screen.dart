import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Roundedbutton.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget{
  static const id = "/welcome";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Hero(
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: 60,
                      ),
                      tag: "logo",
                    ),
                    Text(
                        "Flash Chat",
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w900
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
                RoundedButton(
                  title: const Text(
                            "Log In",
                            style: TextStyle(
                                      color: Colors.white
                            )
                  ),
                  buttonColor: Colors.lightBlue,
                  pressed: (){
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
                RoundedButton(
                  title: const Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white
                      )
                  ),
                  buttonColor: Colors.blueAccent,
                  pressed: (){
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                ),
              ],
            ),
          ),
    );
  }
}