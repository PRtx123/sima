import 'package:flutter/material.dart';
import 'answer.dart';


class Quiz extends StatefulWidget {
  final index;
  final questionData;
  final onChangeAnswer;
  //final NextPage;
  //final lastPage;

  Quiz({Key? key, this.index, this.questionData, this.onChangeAnswer}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30,),
        Container(
          width: 500,
          child: Text(
            widget.questionData.questions[widget.index].title,
            style: TextStyle(color: Colors.black, fontSize: 20.0), textAlign: TextAlign.justify,), //18 было
        ),
        SizedBox(height: 50,),
        ...widget.questionData.questions[widget.index].answer.map(
                (value) => Answer(title: value['answer'], onChangeAnswer: widget.onChangeAnswer,)
        ).toList(),
        //Row(
          //children: [
            //IconButton(onPressed: ()=> widget.lastPage(), icon: Icon(Icons.arrow_back)),
            //IconButton(onPressed: ()=> widget.NextPage(), icon: Icon(Icons.arrow_forward)),
          //],
        //)
      ],

    );
  }
}