
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget{
  final Color? buttonColor ;
  final Widget title;
  var pressed;
  RoundedButton({this.buttonColor,required this.title,required this.pressed});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(

        onPressed:pressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            elevation: 5
        ),
        child: title
      ),
    );
  }
}