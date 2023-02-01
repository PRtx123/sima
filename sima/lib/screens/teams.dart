import 'package:flutter/material.dart';
import 'package:sima/domain/candidate.dart';

class TeamsInfo extends StatefulWidget {
  const TeamsInfo({Key? key}) : super(key: key);

  @override
  _TeamsInfoState createState() => _TeamsInfoState();
}

class _TeamsInfoState extends State<TeamsInfo> {

  List<Candidate> team = <Candidate>[
    Candidate(FIO: 'Александр Володин', index: 'Beginner', date: DateTime.now().day.toString()+'.0'+DateTime.now().month.toString()+'.'+DateTime.now().year.toString(), Image: "https://avatars.mds.yandex.net/get-znatoki/1540166/2a0000016cc1cc8941c8058cb0dab4c93e4e/w800"),
    Candidate(FIO: 'Петр Сидоров',  index: 'Intermediate', date: '12.04.2020',Image: "https://avatars.mds.yandex.net/get-znatoki/1540166/2a0000016cc1cc8941c8058cb0dab4c93e4e/w800"),
    Candidate(FIO: 'Игорь Иванов',  index: 'Advanced', date: '12.04.2020',Image: "https://avatars.mds.yandex.net/get-znatoki/1540166/2a0000016cc1cc8941c8058cb0dab4c93e4e/w800"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0
          , iconTheme: IconThemeData(color: Colors.black),),
        //backgroundColor: primaryColor,
        backgroundColor: Colors.white,
        body: ListView.builder(
            itemCount: team.length,
            itemBuilder: (context, i){
              return Card(
                elevation: 2.0,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: GestureDetector(
                  onTap: (){
                    //Navigator.push(context,
                        //MaterialPageRoute(builder: (_) => LoginScreen()));
                        //MaterialPageRoute(builder: (_) => CandidateInfo(candidate: search[i],)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          )
                        ]
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      leading: Container(
                        //padding: EdgeInsets.only(right: 12),
                        //child: Icon(Icons.account_circle, color: Colors.black, size: 40,),
                        child: Container(
                          width: 40,
                          height: 40,
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
                        //decoration: BoxDecoration(
                        //border: Border(right: BorderSide(width: 2, color: primaryColor))
                        // ),
                      ),
                      title: Text(team[i].FIO, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), //Theme.of(context).textTheme.title!.color
                      trailing: IconButton(color: Colors.red, onPressed: () {}, icon: Icon(Icons.clear),iconSize: 15,),
                    ),
                  ),
                ),
              );
            }
        ),
    );
  }
}
