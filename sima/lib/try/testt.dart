import 'package:flutter/material.dart';
import 'package:sima/model/Question.dart';
import 'package:sima/widgets/QuizEnd.dart';
import 'package:sima/widgets/progress_bar.dart';
import 'package:sima/widgets/quiz.dart';
import 'package:sima/constants.dart';



class TestQuiz extends StatefulWidget {
  const TestQuiz({Key? key}) : super(key: key);

  @override
  _TestQuizState createState() => _TestQuizState();
}

class _TestQuizState extends State<TestQuiz> {

  final QuestionData data = QuestionData();
  int _countResult = 0;
  int _questionIndex = 0;
  List<Icon> _icons = [];

  void _clearState(){
    setState(() {
      _questionIndex = 0;
      _countResult = 0;
      _icons = [];
    });
  }

  void _onChangeAnswer(){
    setState(() {
      if(_countResult<11) {
        _icons.add(Icon(Icons.brightness_1, color: Blue,));
      }
      _countResult++;
      _questionIndex+=1;
    }
    );
  }
  //void _backToPage(){
    //setState(() {
      //if(_countResult>0 && _questionIndex >0) {
        //_countResult--;
        //_questionIndex -= 1;
      //}
    //});
  //}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.white, elevation: 0,iconTheme: IconThemeData(color: Colors.black,),),
        //backgroundColor: primaryColor,
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[
              ProgressBar(count: _questionIndex,icons: _icons,total: data.length),
              _questionIndex < data.length
                  ?Quiz(
                index: _questionIndex,
                questionData: data,
                onChangeAnswer: _onChangeAnswer,
                //NextPage: _onChangeAnswer,
              )
                  : QuizEnd(
                  count: _countResult,
                  total: data.length,
                  onClearState: _clearState),
            ],
          ),
        )
    );
  }
}
