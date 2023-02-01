import 'package:flutter/material.dart';
import 'package:sima/constants.dart';
import 'package:sima/screens/Temsgroup.dart';
import 'package:sima/screens/profile_settings.dart';
import 'analytics.dart';

class NuvBar extends StatefulWidget {
  const NuvBar({Key? key}) : super(key: key);

  @override
  _NuvBarState createState() => _NuvBarState();
}

class _NuvBarState extends State<NuvBar> {
  int currentIndex = 0;
  final screens = [
    AnalyticsView(),
    //Later(),
    TeamsGroup(),
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
