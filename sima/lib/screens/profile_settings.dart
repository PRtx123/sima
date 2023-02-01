import "package:flutter/material.dart";
import '../constants.dart';
import '../main.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool showPassword = true;
  bool changedata = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String FIO = "Сидоров Вадим Алексеевич";
  String email = "sidorovvadim@gmail.com";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: primaryColor,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, //убрал стрелочку
        //backgroundColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 0,
        //leading: IconButton(
          //icon: Icon(
            //Icons.arrow_back,
            //color: Colors.white,
          //),
          //onPressed: () {},
        //),
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => HomePage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 10, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.white.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://e7.pngegg.com/pngimages/165/652/png-clipart-businessperson-computer-icons-avatar-avatar-heroes-public-relations.png",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.white,
                            ),
                            //color: logoGreen,
                            color: Blue,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField(nameController,"ФИО", FIO, false),
              buildTextField(emailController,"E-mail", email, false),
              buildTextField(passwordController,"Пароль", "********", true),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      setState(() {
                            nameController.text = '';
                            emailController.text = '';
                            passwordController.text = '';
                      });
                    },
                    child: Text("очистить",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Blue)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                          FIO = nameController.text;
                          email = emailController.text;
                          nameController.clear();
                          emailController.clear();
                          passwordController.clear();
                      });
                    },
                    //color: logoGreen,
                    color: Blue,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "сохранить",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Center(child: Text('174987', style: TextStyle(color: Color.fromRGBO(0, 117, 219, 0.5), fontWeight: FontWeight.bold, fontSize: 25),))
            ],
          ),
        ),
      ),
    );
  }


  Widget buildTextField(
  TextEditingController controller,String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black),
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: UnderlineInputBorder(
                //borderSide: BorderSide(color: Colors.white)
                borderSide: BorderSide(color: lightBlue)
            ),
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.black12,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            //labelStyle: TextStyle(color: logoGreen, fontSize: 20),
            labelStyle: TextStyle(color: lightBlue, fontSize: 20),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black12,
            )),
      ),
    );

  }
}