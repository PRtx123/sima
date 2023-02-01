import 'package:flutter/material.dart';
import 'package:sima/try/testt.dart';
import '../constants.dart';

class DropdownItem extends StatefulWidget {
  const DropdownItem({Key? key}) : super(key: key);

  @override
  _DropdownItemState createState() => _DropdownItemState();
}

class _DropdownItemState extends State<DropdownItem> {

  final items = ['Команда1','Команда2'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 200,left: 40,right: 40),
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: lightBlue, width: 3)
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    iconSize: 26,
                    icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
                    isExpanded: true,
                    value: value,
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (value)=> setState(() => this.value = value),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,),
            MaterialButton(
              elevation: 0,
              minWidth: 300,
              height: 50,
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => TestQuiz()));
              },
              //color: logoGreen,
              color: Blue,
              child: Text('далее',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              textColor: Colors.white,
            ),
          ],
        ),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),);
}

