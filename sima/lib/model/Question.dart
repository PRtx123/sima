import 'package:flutter/foundation.dart';

class Question{
  late final String title;
  late final List<Map> answer;

  Question({
    required this.title,
    required this.answer,
  });
}

class QuestionData{
  final _data = [
    Question(
        title: 'Возникает ли у вас по окончании какой-либо работы сомнение в качестве исполнения и прибегаете ли вы к проверке - правильно ли все было сделано?',
        answer: [
          {'answer' : 'Да'},
          {'answer' : 'Нет'},
        ]
    ),
    Question(
        title: 'Question2',
        answer: [
          {'answer' : 'Answer1'},
          {'answer' : 'Answer2'},
          {'answer' : 'Answer3'},
          {'answer' : 'Answer!'},
        ]
    ),
    Question(
        title: 'Question2',
        answer: [
          {'answer' : 'Answer1'},
          {'answer' : 'Answer2'},
          {'answer' : 'Answer3'},
          {'answer' : 'Answer!'},
        ]
    ),
    Question(
        title: 'Question2',
        answer: [
          {'answer' : 'Answer1'},
          {'answer' : 'Answer2'},
          {'answer' : 'Answer3'},
          {'answer' : 'Answer!'},
        ]
    ),
    Question(
        title: 'Question2',
        answer: [
          {'answer' : 'Answer1'},
          {'answer' : 'Answer2'},
          {'answer' : 'Answer3'},
          {'answer' : 'Answer!'},
        ]
    ),
    Question(
        title: 'Question2',
        answer: [
          {'answer' : 'Answer1'},
          {'answer' : 'Answer2'},
          {'answer' : 'Answer3'},
          {'answer' : 'Answer!'},
        ]
    ),
    Question(
        title: 'Question2',
        answer: [
          {'answer' : 'Answer1'},
          {'answer' : 'Answer2'},
          {'answer' : 'Answer3'},
          {'answer' : 'Answer!'},
        ]
    ),
    Question(
        title: 'Question2',
        answer: [
          {'answer' : 'Answer1'},
          {'answer' : 'Answer2'},
          {'answer' : 'Answer3'},
          {'answer' : 'Answer!'},
        ]
    ),
    Question(
        title: 'Question2',
        answer: [
          {'answer' : 'Answer1'},
          {'answer' : 'Answer2'},
          {'answer' : 'Answer3'},
          {'answer' : 'Answer!'},
        ]
    ),
    Question(
        title: 'Question2',
        answer: [
          {'answer' : 'Answer1'},
          {'answer' : 'Answer2'},
          {'answer' : 'Answer3'},
          {'answer' : 'Answer!'},
        ]
    ),
    Question(
        title: 'Question2',
        answer: [
          {'answer' : 'Answer1'},
          {'answer' : 'Answer2'},
          {'answer' : 'Answer3'},
          {'answer' : 'Answer!'},
        ]
    ),
    Question(
        title: 'Question2',
        answer: [
          {'answer' : 'Answer1'},
          {'answer' : 'Answer2'},
          {'answer' : 'Answer3'},
          {'answer' : 'Answer!'},
        ]
    ),
    Question(
        title: 'Question2',
        answer: [
          {'answer' : 'Answer1'},
          {'answer' : 'Answer2'},
          {'answer' : 'Answer3'},
          {'answer' : 'Answer!'},
        ]
    ),
    Question(
        title: 'Question2',
        answer: [
          {'answer' : 'Answer1'},
          {'answer' : 'Answer2'},
          {'answer' : 'Answer3'},
          {'answer' : 'Answer!'},
        ]
    ),
    Question(
        title: 'Question2',
        answer: [
          {'answer' : 'Answer1'},
          {'answer' : 'Answer2'},
          {'answer' : 'Answer3'},
          {'answer' : 'Answer!'},
        ]
    ),
    Question(
        title: 'Question2',
        answer: [
          {'answer' : 'Answer1'},
          {'answer' : 'Answer2'},
          {'answer' : 'Answer3'},
          {'answer' : 'Answer!'},
        ]
    ),
  ];

  get questions => _data;

  get length => _data.length;

}