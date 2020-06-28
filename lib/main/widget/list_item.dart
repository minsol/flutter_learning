
import 'package:flutter/cupertino.dart';

class ListViewItem extends StatelessWidget {
  final String title;
  ListViewItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Color(0xffe2e2e2)))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20,),
          Text(
            '$title',
            style: TextStyle(fontSize: 16, color: Color(0xff000000)),
          )
        ],
      ),
    );
  }
}