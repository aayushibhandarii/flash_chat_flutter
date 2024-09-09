import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MessageBubble extends StatelessWidget{
  final String text;
  final String sender;
  final bool isMe;
  MessageBubble({required this.sender,required this.text,required this.isMe});
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
              sender,
              textAlign: TextAlign.start,
              style : const TextStyle(
                  fontSize: 10,
                  color : Colors.grey
              )
          ),
          Material(
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            borderRadius: isMe ?
                    const BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)) :
                    const BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
            ,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  color: isMe ? Colors.white : Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}