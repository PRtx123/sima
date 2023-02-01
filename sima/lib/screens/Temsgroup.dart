import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:sima/constants.dart';

class TeamsGroup extends StatefulWidget {
  const TeamsGroup({Key? key}) : super(key: key);

  @override
  _TeamsGroupState createState() => _TeamsGroupState();
}

class _TeamsGroupState extends State<TeamsGroup> {

  final elements = [
    {'group': 'Команда1', 'name': 'Петр Сидоров'},
    {'group': 'Команда1', 'name': 'Иван Трушин'},
    {'group': 'Команда1', 'name': 'Кирилл Петров'},
    {'group': 'Команда2', 'name': 'Дмитрий Берченко'},
    {'group': 'Команда2', 'name': 'Владимир Митов'},

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: GroupedListView<dynamic, String>(
          //useStickyGroupSeparators: true,
          //itemComparator: (item1, item2) =>
            //item1['name'].compareTo(item2['name2']),
          //groupComparator: (value1, value2) => value2.compareTo(value1),
          elements: elements,
          groupBy: (element) => element['group'],
          groupSeparatorBuilder: (value) => Container(
            //width: double.infinity,
            margin: EdgeInsets.only(bottom: 10, top: 4),
            padding: EdgeInsets.only(left: 10),
            color: Colors.white,
            child: Text(value, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
          ),
          itemBuilder: (context, element) => Dismissible(
            key: UniqueKey(),
            background: Container(margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12), child: Icon(Icons.delete_forever),decoration: BoxDecoration(
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
                    title: const Text("Удаление сотрудника"),
                    content: const Text("Вы точно хотите удалить данного сотрудника?"),
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
                elements.removeAt(element);
              });
            },
            child: Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
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
                    title: Text(element['name'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), //Theme.of(context).textTheme.title!.color
                    trailing: IconButton(color: Colors.red, onPressed: () {}, icon: Icon(Icons.clear),iconSize: 15,),
                  ),
                ),
              ),
          ),
          ),
    );
  }
}
