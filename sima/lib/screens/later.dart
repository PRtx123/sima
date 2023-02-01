import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sima/screens/teams.dart';


class Later extends StatefulWidget {
  const Later({Key? key}) : super(key: key);

  @override
  State<Later> createState() => _LaterState();
}

class _LaterState extends State<Later> {
  List list=[];

  _readData() async {
    await DefaultAssetBundle.of(context).loadString("assets/teams.json").then((s) {
      setState(() {
        list = json.decode(s);
      });
    });
  }

  @override
  void initState(){
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          //margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 40,),
                Text("Список команд",style: TextStyle(fontSize: 25,color: Colors.black, fontWeight: FontWeight.bold),),
                //SizedBox(height: 10,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for(int i = 0;i<list.length;i++)
                             Container(
                                height: 130,
                                margin: const EdgeInsets.only( left: 40,right: 30,top: 30),
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) => TeamsInfo()));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 20, top: 20),
                                    height: 220,
                                    width: MediaQuery.of(context).size.width-20,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                            child:Row(
                                              children: [
                                                Text(
                                                  list[i]['name'],
                                                  style: TextStyle(
                                                      fontSize: 21,
                                                      fontWeight: FontWeight.bold,
                                                      color:Colors.black

                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                        SizedBox(height: 30,),
                                        Container(
                                            child:Row(
                                              children: [
                                                Text(
                                                  'Кол-во участников:',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color:Colors.black

                                                  ),
                                                ),
                                                SizedBox(width: 10,),
                                                Text(
                                                  list[i]['count'],
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,

                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}