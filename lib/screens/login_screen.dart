import 'package:flash_chat/Roundedbutton.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'chat_screen.dart';


class LoginScreen extends StatefulWidget{
  static const id = "/login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  bool spin = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _auth = FirebaseAuth.instance;
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
              Hero(
                tag: "logo",
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: kTextFileDecoration.copyWith(
                    hintText: "Enter your Email"
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              TextField(
                controller: passController,
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: kTextFileDecoration.copyWith(
                  hintText: "Enter your password"
                ),

              ),
              const SizedBox(
                height: 24,
              ),
              RoundedButton(
                  title: spin ?
                  const CircularProgressIndicator() :
                  const Text(
                    "Log In",
                    style: TextStyle(
                        color: Colors.white
                    )
                  )  ,
                buttonColor: Colors.blueAccent,
                pressed: ()async{
                    try{
                      setState(() {
                        spin = true;
                      });
                      final user = await _auth.signInWithEmailAndPassword(
                          email: emailController.text.toString(),
                          password: passController.text.toString()
                      );
                      if(user != null){
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState((){
                        spin = false;
                      });

                    }catch (e){
                      print(e);
                      Navigator.pop(context);
                    }
                },
              ),
            ],
          ),
        ),
    );
  }
}