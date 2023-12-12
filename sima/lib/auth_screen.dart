import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sima/constants.dart';
import 'package:sima/screens/adminpanel.dart';
import 'package:sima/screens/login.dart';
import 'package:sima/screens/nuv.dart';
import 'package:sima/screens/testreg.dart';
import 'package:sima/try/testt.dart';
import 'package:sima/widgets/login_form.dart';
import 'package:sima/widgets/sign_up_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  bool _isShowSignUp = false;
  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;

  void setUpAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: defaultDuration);

    _animationTextRotate =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  void updateView() {
    setState(() {
      _isShowSignUp = !_isShowSignUp;
    });
    _isShowSignUp ? _animationController.forward() : _animationController
        .reverse();
  }


  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return Stack(
                children: [
                  AnimatedPositioned(
                    duration: defaultDuration,
                    width: _size.width * 0.88,
                    height: _size.height,
                    left: _isShowSignUp ? -_size.width * 0.76 : 0,
                    child: Container(
                      color: logoGreen,
                      child: LoginForm(),
                    ),
                  ),
                  AnimatedPositioned(
                      duration: defaultDuration,
                      height: _size.height,
                      width: _size.width * 0.88,
                      left: _isShowSignUp ? _size.width * 0.12 : _size.width *
                          0.88,
                      child: Container(
                        color: primaryColor,
                        child: SignUpForm(),
                      )
                  ),
                  AnimatedPositioned(
                    duration: defaultDuration,
                    top: _size.height * 0.1,
                    left: 0,
                    right: _isShowSignUp ? -_size.width * 0.06 : _size.width *
                        0.06,
                    child: Column(children: <Widget>[
                      Image.asset(
                        'assets/logo.png',
                        height: 50,
                      ),
                      Text('SiMa', style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),)
                    ]
                    ),
                  ),


                  //login text
                  AnimatedPositioned(
                    duration: defaultDuration,
                    bottom: _isShowSignUp ? _size.height / 2 - 80 : _size
                        .height * 0.3,
                    left: _isShowSignUp ? 0 : _size.width * 0.44 - 80,
                    child: AnimatedDefaultTextStyle(
                      duration: defaultDuration,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: _isShowSignUp ? 20 : 32,
                        fontWeight: FontWeight.bold,
                        color: _isShowSignUp ? Colors.white : Colors.white70,
                      ),
                      child: Transform.rotate(
                        angle: -_animationTextRotate.value * pi / 180,
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () {
                            if (_isShowSignUp) {
                              updateView();
                            } else {
                              //login
                              Navigator.push(context,
                                  //MaterialPageRoute(builder: (_) => NuvBar()));
                                  MaterialPageRoute(builder: (_) => AdminPanel()));
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: defpaultPadding * 0.75),
                            width: 160,
                            child: Text(
                              'Log In'.toUpperCase(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  AnimatedPositioned(
                    duration: defaultDuration,
                    bottom: !_isShowSignUp ? _size.height / 2 - 80 : _size
                        .height * 0.3,
                    right: _isShowSignUp ? _size.width * 0.44 - 80 : 0,
                    child: AnimatedDefaultTextStyle(
                      duration: defaultDuration,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: !_isShowSignUp ? 20 : 29,
                        fontWeight: FontWeight.bold,
                        color: Colors
                            .white, //!_isShowSignUp ? Colors.white : Colors.white70
                      ),
                      child: Transform.rotate(
                        angle: (90 - _animationTextRotate.value) * pi / 180,
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            if (_isShowSignUp) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => TestQuiz()));
                            } else {
                              updateView();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: defpaultPadding * 0.75),
                            width: 190,
                            child: Text(
                              'Get tested'.toUpperCase(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
        )
    );
  }

}