
import 'package:flutter/material.dart';
import 'package:sima/constants.dart';
import 'package:sima/screens/profile_settings.dart';

import 'analytics.dart';
import 'later.dart';

class NuvBar extends StatefulWidget {
  const NuvBar({Key? key}) : super(key: key);

  @override
  _NuvBarState createState() => _NuvBarState();
}

class _NuvBarState extends State<NuvBar> {

  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);

  int currentIndex = 0;

  final screens = [
    AnalyticsView(),
    Later(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: primaryColor,
        backgroundColor: Blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: 'Кандидаты'),
          BottomNavigationBarItem(icon: Icon(Icons.equalizer_sharp), label: 'Команды'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Профиль'),

        ],
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
