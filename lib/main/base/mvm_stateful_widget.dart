
import 'package:flutter/cupertino.dart';

class MVMStatefulWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // 将创建的State返回
    return MVMState();
  }
}

class MVMState extends State<MVMStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Text('123');
  }



}
