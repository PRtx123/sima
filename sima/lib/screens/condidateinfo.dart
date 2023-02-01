import 'package:flutter/material.dart';
import 'package:sima/domain/candidate.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'nuv.dart';

class CandidateInfo extends StatelessWidget {
  final Candidate candidate;
  const CandidateInfo({Key? key, required this.candidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => NuvBar()));
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Center(child: Text("Рекомендация по командам", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 19),),),
            Container(
              child: Center(
                child: Echarts(
                  option: '''
                         {
                        xAxis: {
                          type: 'category',
                          data: ['Команда1', 'Команда2',]
                        },
                        yAxis: {
                          type: 'value'
                        },
                        series: [
                          {
                            data: [
                              0.55,
                              0.3,
                            ],
                            type: 'bar'
                          }
                        ]
                      }
                        ''',
                ),
              ),
              width: 800,
              height: 250,
            ),
            Center(child: Text("Перечень сравнительных характеристик", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 19),),),
            Container(
              //padding: EdgeInsets.only(left: 30),
              //legend: { кнопки снизу графика
                //orient: 'horizontal',
                //bottom: 'bottom'
              //},
              child: Center(
                child: Echarts(
                  option: '''
                            {
                     title: {
                              text: '',
                              left: 'center'
                            },                                   
                            tooltip: {
                              trigger: 'item'
                            },
                            series: [
                              {
                                name: 'Характеристика',
                                type: 'pie',
                                radius: '50%',
                                data: [
                                  { value: 0.55, name: 'Гипертимность' },
                                  { value: 0.7, name: 'Дистимичность' },
                                  { value: 0.3, name: 'Циклотимность' },
                                  { value: 0.5, name: 'Эмоциональность' },
                                  { value: 0.2, name: 'Демонстративность' },
                                  { value: 0.7, name: 'Застревание' },
                                  { value: 0.3, name: 'Педантичность' },
                                  { value: 0.45, name: 'Тревожность' },
                                  { value: 0.40, name: 'Возбудимость' },
                                  { value: 0.18, name: 'Экзальтированность'},
                                  { value: 0.11, name: 'Ложь' }
                                ],
                                emphasis: {
                                  itemStyle: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                  }
                                }
                              }
                            ]
                      }
                        ''',
                ),
              ),
              width: 800,
              height: 350,
            ),
            //Text(candidate.FIO),
            //Text(candidate.index),
          ],
        ),
      ),
    );
  }
}
