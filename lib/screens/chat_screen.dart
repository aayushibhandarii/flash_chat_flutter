import 'package:flash_chat/MessageBubbleWidget.dart';
import 'package:flash_chat/messageStream.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget{
  static const id = "/chat";
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>{
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  User? loggedInUser;
  TextEditingController msgController = TextEditingController();
  void getCurrentUser()async{

    try{
      final user = await _auth.currentUser;
      if(user != null){
        loggedInUser = user;
        print(loggedInUser);
      }
    } catch (e){
      print(e);
    }
  }

  @override
  void initState() {
    getCurrentUser();

    super.initState();
  }
  @override
  Widget build(BuildContext context){

    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            actions: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: (){
                  _auth.signOut();
                  Navigator.pop(context);
                },
              ),
            ],
            title: const Text("Chat"),
          ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MessageStream(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: msgController,
                    cursorColor: Colors.lightBlue,

                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type your message here...",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey
                      )
                    ),
                  ),
                ),
                TextButton(
                    onPressed: (){
                        _firestore.collection("messages").add({
                          "text" : msgController.text.toString(),
                          "sender" : loggedInUser?.email,
                          "timestamp" : FieldValue.serverTimestamp()
                        });
                        // msgController.text = "";
                      msgController.clear();
                    },
                    child: const Text(
                        "Send",
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 20
                      ),
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}