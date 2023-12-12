import 'package:flutter/material.dart';
import 'package:sima/screens/about.dart';
import 'package:sima/screens/login.dart';
import 'package:sima/screens/testreg.dart';
import 'package:sima/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() async {
  runApp(MaterialApp(home: HomePage(),));
  //runApp(MaterialApp(home: Profile(),));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);

  List carouselitems = ['Самое лучшее приложение в мире','Example1','Example2'];
  final frstcontroller = CarouselController();
  int activeIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: primaryColor,
      backgroundColor: Colors.white,  //меняем цвет фона на белый
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              height: 120,
            ),
            //Icon(Icons.all_inclusive_outlined, size: 120, color: logoGreen,),
            SizedBox(
              height: 20,
            ),
            //Texts and Styling of them
            Text(
              'SiMa',
              textAlign: TextAlign.center,
              //style: TextStyle(color: Colors.white, fontSize: 28, ),
              style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold ),
            ),
            SizedBox(height: 20),
             Container(
               child: CarouselSlider.builder(
                 itemBuilder: (context,index,realIndex){
                   //final items = carouselitems[index];
                   return Text(carouselitems[index], style: TextStyle(color: Colors.black, fontSize: 15),);
                 },
                 carouselController: frstcontroller,
                 options: CarouselOptions(
                   height: 50,
                   initialPage: 0,
                   viewportFraction: 1,
                   autoPlay: true,
                   autoPlayInterval: Duration(seconds: 3),
                   onPageChanged: (index, reason) =>
                       setState(() => activeIndex = index),
                 ),
                 itemCount: carouselitems.length,
               ),
             ),
            //SizedBox(height: 20),
            buildIndicator(),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              height: 50,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => LoginScreen()));
                    //MaterialPageRoute(builder: (_) => AnalyticsView()));
                    //MaterialPageRoute(builder: (_) => SelectionScreen()));
                    //MaterialPageRoute(builder: (_) => AuthScreen()));
              },
              //color: logoGreen,
              color: Blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Вход',
                      style: TextStyle(color: Colors.white, fontSize: 20)),

                ],
              ),
              textColor: Colors.white,
            ),
            SizedBox(height: 15,),
            MaterialButton(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              height: 50,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => TestRegistration()));
              },
              //color: logoGreen,
              color: Blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Тестирование',
                      style: TextStyle(color: Colors.white, fontSize: 20)),

                ],
              ),
              textColor: Colors.white,
            ),
            SizedBox(height: 15,),
            MaterialButton(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              height: 50,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AboutPage()));
              },
              //color: logoGreen,
              color: Blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('О приложении',
                      style: TextStyle(color: Colors.white, fontSize: 20)),

                ],
              ),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() =>  AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: carouselitems.length,
      effect: SlideEffect(
        activeDotColor: Blue,
        dotWidth: 8,
        dotHeight: 8,
      ),
  );

}