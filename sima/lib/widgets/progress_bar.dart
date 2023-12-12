import 'package:flutter/material.dart';


class ProgressBar extends StatelessWidget {
  final icons;
  final count;
  final total;
  const ProgressBar({Key? key, this.icons, this.count,this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              '$count - $total',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
          ),
          SizedBox(width: 10,),

          ...icons,
        ],
      ),
    );
  }
}