import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Roundedbutton.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget{
  static const id = "/registration";
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>{
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
                )
            ),
            const SizedBox(
              height: 48,
            ),
            TextField(
              keyboardType:TextInputType.emailAddress,
              textAlign: TextAlign.center,
              controller: emailController,
              decoration: kTextFileDecoration.copyWith(
                  hintText: "Enter your Email"
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              controller: passController,
              decoration: kTextFileDecoration.copyWith(
                  hintText: "Enter your password"
              )
            ),
            const SizedBox(
              height: 24,
            ),
            RoundedButton(
              title: spin ?
              const CircularProgressIndicator() :
              const Text(
                "Register",
                style: TextStyle(
                    color: Colors.white
                )
              ),
              buttonColor: Colors.blueAccent,
              pressed: () async {

                try{
                  spin = true;
                  print("yoo");
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: emailController.text.toString(),
                      password: passController.text.toString()
                  );
                  print(newUser);
                  if(newUser != null){
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                  setState((){
                    spin = false;
                  });
                }catch(e){
                  print("error");
                  print(e);
                }


              },
            ),

          ],
        ),
      ),
    );
  }
}