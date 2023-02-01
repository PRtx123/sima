import 'package:flutter/material.dart';
import 'package:sima/screens/testreg.dart';
import 'login.dart';


class SelectionScreen extends StatelessWidget {


  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xff25bcbb);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(children: <Widget>[
          Image.asset(
            'assets/logo.png',
            height: 120,
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 50,
          ),
          MaterialButton(
            elevation: 0,
            minWidth: double.maxFinite,
            height: 50,
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => LoginScreen()));
            },
            color: logoGreen,
            child: Text('Admin',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            textColor: Colors.white,
          ),
          SizedBox(height: 20),
          MaterialButton(
            elevation: 0,
            minWidth: double.maxFinite,
            height: 50,
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => TestRegistration()));
            },
            color: logoGreen,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 10),
                Text('Get tested',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
            textColor: Colors.white,
          ),
          SizedBox(height: 100),
        ],),
      ),
    );
  }
}