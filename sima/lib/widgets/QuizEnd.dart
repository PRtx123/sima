import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sima/main.dart';
class QuizEnd extends StatelessWidget {

  final int count;
  final int total;
  final Function onClearState;

  QuizEnd({Key? key, required this.count, required this.total, required this.onClearState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String msg = 'Тест успешно пройден! \n'
        ' Ожидайте решения HR';

    return Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 50),
        child: Column(
          children: [
            Text(
              msg,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            IconButton(
                onPressed: (){
          Navigator.push(context,
          MaterialPageRoute(builder: (_) => HomePage()));
    },
                icon: Icon(Icons.home))
          ],
        )

    );
  }
}