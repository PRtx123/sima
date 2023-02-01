
import 'package:flutter/material.dart';

import '../constants.dart';

class Answer extends StatefulWidget {
  final String title;
  final Function onChangeAnswer;

  Answer({Key? key, required this.title, required this.onChangeAnswer}) : super(key: key);

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChangeAnswer(),
      //onTap: (){
      //String test;
      //onChangeAnswer();
      //test = title;
      //print(test);
      //},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        padding: const EdgeInsets.all(10.0),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          //boxShadow: [BoxShadow(
              //color: Colors.black,
              //blurRadius: 10.0,
              //offset: Offset(1.0,1.0)
         // )
          //],
          //gradient: kPrimaryGradient,
          //color: logoGreen
          color: Blue
        ),
          child: Text(widget.title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 19.0) ),
      ),
    );
  }
}