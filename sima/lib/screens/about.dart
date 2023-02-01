import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0
        , iconTheme: IconThemeData(color: Colors.black),),
        //backgroundColor: primaryColor,
        backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Text("Данное приложение выполнено студентом РТУ МИРЭА Сидоровым В.А в рамках дипломной работы"),
      ),
    );
  }
}

