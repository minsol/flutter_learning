import 'package:flutter/material.dart';
import 'package:flutter_learning/main/widget/tab_navigater.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'PingFang',
      ),
      home: new Scaffold(
        body: TabNavigator(),
      ),
    );
  }
}

