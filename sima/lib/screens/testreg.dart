import 'package:flutter/material.dart';
import 'package:sima/screens/dropdownlist.dart';
import 'package:sima/try/testt.dart';
import 'package:sima/constants.dart';

class TestRegistration extends StatefulWidget {
  const TestRegistration({Key? key}) : super(key: key);

  @override
  _TestRegistrationState createState() => _TestRegistrationState();
}

class _TestRegistrationState extends State<TestRegistration> {

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

  bool _value = false;
  bool _valueSwitch = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0
        , iconTheme: IconThemeData(color: Colors.black),),
      //backgroundColor: primaryColor,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            //margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Text("Регистрация",style: TextStyle(fontSize: 25,color: Colors.black, fontWeight: FontWeight.bold),),
                      SizedBox(height: 30,),
                      _buildTextField(nameController, 'Имя'),
                      SizedBox(height: 20,),
                      _buildTextField(secondController, 'Фамилия'),
                      SizedBox(height: 20,),
                      _buildTextField(codeController, 'Код организации'),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                Container(
                  //color: Colors.purple,
                  child: Column(
                    children: [
                      SwitchListTile(
                        contentPadding: EdgeInsets.only(left: 10),
                        title: Padding(padding: EdgeInsets.only(left: 12),
                        child: Text('Прохождение тестирования сотрудником',style: TextStyle(fontSize: 13,color: Colors.black),)),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _valueSwitch,
                        activeTrackColor: lightBlue,
                        activeColor: Blue,
                        onChanged: (value) {
                          setState(() {
                            _valueSwitch = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        contentPadding: EdgeInsets.only(bottom: 10,right: 30,left: 15),
                        title: Padding(padding: EdgeInsets.only(left: 25),
                        child: const Text('Согласие на обработку персональных данных',style: TextStyle(fontSize: 12,color: Colors.black),)),
                        controlAffinity: ListTileControlAffinity.leading,
                        autofocus: false,
                        activeColor: Blue,
                        checkColor: Colors.white,
                        //selected: _value,
                        value: _value,
                        onChanged: ( value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: MaterialButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    minWidth: double.maxFinite,
                    height: 50,
                    onPressed: () async {
                      //if(nameController.text != '' && secondController.text != ''){
                      if(nameController.text != "" && secondController.text != "" && codeController.text != "") {
                        if(_value == true) {
                          if (codeController.text.length == 6) {
                            if(_valueSwitch==true) {
                              addCondidate();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => DropdownItem()));
                            }
                            else{
                              addCondidate();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => TestQuiz()));
                            }
                          }
                          else {
                            _showMessageDialog(
                                context, 'Код организации состоит из 6 цифр!');
                          }
                        }
                        else{
                          _showMessageDialog(
                              context, 'Необходимо подтвердить согласие на обработку персональных данных');
                        }
                      }
                      else{
                        _showMessageDialog(context,'Заполните пустые поля');
                      }
                      //}
                    },
                    //color: logoGreen,
                    color: Blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: 10),
                        Text('Начать тестирование',
                            style: TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    ),
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ) ,
    );
  }

  _showMessageDialog(BuildContext context, String message) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Ошибка регистрации',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        content: Text(message,style: TextStyle(color: Colors.black, fontSize: 15),),
        actions: [
          FlatButton(
            onPressed: ()=> Navigator.of(context).pop(),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Text('Закрыть', style: TextStyle(color: Blue),),
          )
        ],
      )
  );
}
