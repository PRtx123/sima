
import 'package:flutter/material.dart';
import 'package:sima/constants.dart';
import 'package:sima/domain/candidate.dart';
import 'package:sima/screens/condidateinfo.dart';

class AnalyticsView extends StatefulWidget {
  const AnalyticsView({Key? key}) : super(key: key);

  @override
  _AnalyticsViewState createState() => _AnalyticsViewState();
}

class _AnalyticsViewState extends State<AnalyticsView> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),// запрещает вернуться к окну авторизации
      child: Container(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: WorkoutsList(),
          )
      ),
    );
  }
}

class WorkoutsList extends StatefulWidget {

  @override
  State<WorkoutsList> createState() => _WorkoutsListState();
}

class _WorkoutsListState extends State<WorkoutsList> {

   List<Candidate> candidates = <Candidate>[
    Candidate(FIO: 'Зейналов Магеррам', index: 'Beginner', date: '12.04.2022', Image: "https://avatars.mds.yandex.net/get-znatoki/1540166/2a0000016cc1cc8941c8058cb0dab4c93e4e/w800"),
    Candidate(FIO: 'Сидоров Вадим',  index: 'Intermediate', date: '12.04.2022',Image: "https://avatars.mds.yandex.net/get-znatoki/1540166/2a0000016cc1cc8941c8058cb0dab4c93e4e/w800"),
    Candidate(FIO: 'Басыров Серегй',  index: 'Advanced', date: '12.04.2022',Image: "https://avatars.mds.yandex.net/get-znatoki/1540166/2a0000016cc1cc8941c8058cb0dab4c93e4e/w800"),
    Candidate(FIO: 'Дорожков Кирилл',  index: 'Beginner', date: '12.04.2022',Image: "https://avatars.mds.yandex.net/get-znatoki/1540166/2a0000016cc1cc8941c8058cb0dab4c93e4e/w800"),
    Candidate(FIO: 'Фроленко Максим',  index: 'Intermediate', date: '12.06.2022',Image: "https://avatars.mds.yandex.net/get-znatoki/1540166/2a0000016cc1cc8941c8058cb0dab4c93e4e/w800"),
  ];

  final controller = TextEditingController();

  late List<Candidate> search = candidates;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30,left: 10,right: 10),
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20,left: 10,right: 10),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  prefixIcon:  Icon(Icons.search,color: Blue,),
                  hintText: "введите ФИО кандидата",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:  BorderSide(color: Blue),
                  ),
                ),
                onChanged: searchCandidate,
              ),
            ),
            //SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                  itemCount: search.length,
                  itemBuilder: (context, i){
                    final candidate = candidates[i];
                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8), child: Icon(Icons.delete_forever),decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ]
                      ),),
                      confirmDismiss: (DismissDirection direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Удаление кандидата"),
                              content: const Text("Вы точно хотите удалить данного кандидата?"),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () => Navigator.of(context).pop(false),
                                    child:  Text("Отмена", style: TextStyle(color: Blue),)
                                ),
                                FlatButton(
                                  onPressed: () => Navigator.of(context).pop(true),
                                  child:  Text("Удалить", style: TextStyle(color: Blue),),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      onDismissed: (_){
                        setState(() {
                          candidates.removeAt(i);
                        });
                      },
                      child: Card(
                        elevation: 2.0,
                        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                //MaterialPageRoute(builder: (_) => LoginScreen()));
                                MaterialPageRoute(builder: (_) => CandidateInfo(candidate: search[i],)));
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
                              title: Text(search[i].FIO, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), //Theme.of(context).textTheme.title!.color
                              trailing: Icon(Icons.keyboard_arrow_right, color: Blue,),
                              subtitle: subtitle(context, search[i]),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        )
      ),
    );
  }
  void searchCandidate(String query){
    final suggestion = candidates.where((candidate) {
      final FIO = candidate.FIO.toLowerCase();
      final input = query.toLowerCase();

      return FIO.contains(input);
    }).toList();
    setState(() => search = suggestion);
  }
}

Widget subtitle(BuildContext context, Candidate candidate){
  Color color = Colors.grey;
  double indicatorLevel = 0;

  switch(candidate.index){
    case 'Beginner':
      color = Blue;//red
      indicatorLevel = 0.33;
      break;
    case 'Intermediate':
      color = Blue;//yellow
      indicatorLevel = 0.66;
      break;
    case 'Advanced':
      color = Blue;//green
      indicatorLevel = 1;
      break;
  }

  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5)
          ),
          child: LinearProgressIndicator(
            backgroundColor: Colors.white, //
            value: indicatorLevel,
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        flex: 1,
        child: Text(candidate.date, style: TextStyle(color: Colors.black)), //
      )
    ],
  );
}
