import 'package:flutter/material.dart';
import 'package:flutter_learning/util/navigator_util.dart';

/*
* 按钮监听->回调
* */
//第一种自定义回调方法
typedef MyCallBackFunction= void Function(String string);


abstract class SecondFlutterWidgetDelegate {
  void onCallback(String result);
}

class SecondFlutterWidget extends StatefulWidget{
  final String titleString;
  final SecondFlutterWidgetDelegate callBackDelegate;
  MyCallBackFunction callBackFunction; //第二种:回调函数的签名，没有参数，也不返回数据。
  SecondFlutterWidget({Key key, this.titleString,this.callBackFunction,this.callBackDelegate}) : super(key: key);
  _ContentWidgetState createState() => new _ContentWidgetState();
}


class _ContentWidgetState extends State<SecondFlutterWidget>{
  @override
  Widget build(BuildContext context) {
    final SecondFlutterWidget widget = this.widget;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleString),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Center(
                child: Text(widget.titleString),
              )
            ),
            Container(
              child:Center(
                child: FlatButton(
                onPressed: onPress,
                child: Text('按钮',style: TextStyle(fontSize: 16.0,color: Colors.black,),),
                color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
  //第二种
  void onPress(){
    ///方式1
    Navigator.pop(context,"通过 NavigatorUtil 回调参数");
    ///方式2
    widget.callBackFunction("通过 callBackFunction 回调参数");
    ///方式三
    widget.callBackDelegate.onCallback("通过 callBackDelegate 回调参数");
  }

}