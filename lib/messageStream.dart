import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'MessageBubbleWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessageStream extends StatelessWidget{
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection("messages").orderBy("timestamp" ,descending: true).snapshots(),
        builder: (context,snapshot){
          List<Widget> messageWidgets = [];
          if(snapshot.hasData){
            final messages = snapshot.data?.docs;

            for(var message in messages!){
              final messageText = (message.data() as Map<String,dynamic>)["text"];
              final messageSender = (message.data() as Map<String,dynamic>)["sender"];

              messageWidgets.add(MessageBubble(sender: messageSender, text: messageText,isMe : messageSender == _auth.currentUser?.email));
            }

          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              scrollDirection: Axis.vertical,
              children: messageWidgets,
            ),
          );
        }
    );
  }
}