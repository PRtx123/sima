import 'package:flutter/material.dart';
import 'adminpanel.dart';
import 'nuv.dart';
import 'package:sima/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  List auth=['test@gmail.com','test@yandex.ru'];
  List pass=['111111','222222'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: primaryColor,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        padding: EdgeInsets.only(top: 20),
        child: Column(children: <Widget>[
          Text(
            'Авторизация',
            textAlign: TextAlign.center,
            style:
            TextStyle(fontSize: 25,color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          _buildTextField(nameController,Icons.account_circle,'Email',false),
          SizedBox(height: 20),
          //_buildTextField(passwordController,'Password',Icons.lock),
          _buildTextField(passwordController,Icons.lock,'Пароль',true),
          Padding(padding: EdgeInsets.only(left: 410),child: TextButton(child: Text("Забыли пароль?", style: TextStyle(fontSize: 12,color: Colors.black),),onPressed: (){},),),
          //SizedBox(height: 20),
          MaterialButton(
            elevation: 0,
            minWidth: double.maxFinite,
            height: 50,
            onPressed: () async {
                if(nameController.text != "" && passwordController.text != "") {
                  if(auth.contains(nameController.text) && pass.contains(passwordController.text)) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => NuvBar()));
                  }
                  else{
                    _showMessageDialog(context,'Неверный логин или пароль');
                  }
                }
                else{
                  _showMessageDialog(context,'Заполните пустые поля');
                }
            },
            //color: logoGreen,
            color: Blue,
            child: Text('Войти',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            textColor: Colors.white,
          ),
          //SizedBox(height: 100),
        ],),
      ),
    );
  }


  _buildTextField(
      TextEditingController controller, IconData icon, String labelText, bool flag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          //color: secondaryColor, border: Border.all(color: Colors.blue)),
          color: Colors.white, border: Border.all(color: Blue)),
      child: TextField(
        obscureText: flag,
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: lightBlue),
            icon: Icon(
              icon,
              color: lightBlue,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }

  _showMessageDialog(BuildContext context, String message) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Ошибка авторизации',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
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

