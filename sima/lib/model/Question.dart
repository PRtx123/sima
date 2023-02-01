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
        title: 'Нравится ли Вам работа, когда только Вы один ответственны за нее?',
        answer: [
          {'answer' : 'Да'},
          {'answer' : 'Нет'},
        ]
    ),
    Question(
        title: 'Предпочитаете ли Вы деятельность, которую нужно выполнять долго и точно, той, которая не требует большой кропотливости и делается быстро?',
        answer: [
          {'answer' : 'Да'},
          {'answer' : 'Нет'},
        ]
    ),
    Question(
        title: 'Вы очень общительный человек?',
        answer: [
          {'answer' : 'Да'},
          {'answer' : 'Нет'},
        ]
    ),
    Question(
        title: 'Часто ли Вам жизнь кажется тяжелой?',
        answer: [
          {'answer' : 'Да'},
          {'answer' : 'Нет'},
        ]
    ),
    Question(
        title: 'Говорите ли Вы людям свое мнение о них прямо в глаза?',
        answer: [
          {'answer' : 'Да'},
          {'answer' : 'Нет'},
        ]
    ),
    Question(
        title: 'Легко ли Вы впадаете в гнев?',
        answer: [
          {'answer' : 'Да'},
          {'answer' : 'Нет'},
        ]
    ),
    Question(
        title: 'Часто ли у Вас резко меняется настроение от состояния безграничного ликования до отвращения к жизни, к себе?',
        answer: [
          {'answer' : 'Да'},
          {'answer' : 'Нет'},
        ]
    ),
    Question(
        title: 'Являетесь ли вы обычно центром внимания в обществе, в компании?',
        answer: [
          {'answer' : 'Да'},
          {'answer' : 'Нет'},
        ]
    ),
    Question(
        title: 'Стремитесь ли вы всегда считаться в числе лучших работников?',
        answer: [
          {'answer' : 'Да'},
          {'answer' : 'Нет'},
        ]
    ),
    Question(
        title: ' Если по отношению к Вам несправедливо поступили, Вы обычно считаете нужным энергично отстаивать свои интересы',
        answer: [
          {'answer' : 'Да'},
          {'answer' : 'Нет'},
        ]
    ),
  ];

  get questions => _data;

  get length => _data.length;

}