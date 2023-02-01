import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sima/try/testt.dart';
import '../constants.dart';


class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {

  TextEditingController nameController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  late Map<String,dynamic> candidateAdd;

  addCondidate(){
    candidateAdd = {
      "name" : nameController.text,
      "secondname": secondController.text,
      "code" : codeController.text,
    };

  }

  _buildTextField(
      TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        //color: secondaryColor, border: Border.all(color: logoGreen)),
          color: Colors.white,border: Border.all(color: Blue)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: lightBlue,),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0
        , iconTheme: IconThemeData(color: Colors.black),),
      //backgroundColor: primaryColor,
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text("Добавление пользователя",style: TextStyle(fontSize: 25,color: Colors.black, fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            _buildTextField(nameController, 'ФИО'),
            SizedBox(height: 20,),
            _buildTextField(secondController, 'e-mail'),
            SizedBox(height: 20,),
            _buildTextField(codeController, 'Код организации'),
            SizedBox(height: 20,),
            MaterialButton(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              minWidth: double.maxFinite,
              height: 50,
              onPressed: () async {
                //if(nameController.text != '' && secondController.text != ''){
                addCondidate();
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => TestQuiz()));
                //}

              },
              //color: logoGreen,
              color: Blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 10),
                  Text('Добавить',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
              textColor: Colors.white,
            ),
          ],
        ),
      ) ,
    );
  }
}


