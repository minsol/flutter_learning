import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_learning/Main/app.dart';
const bool inProduction = const bool.fromEnvironment("dart.vm.product");

void main() {
  //debugPaintSizeEnabled=!inProduction;
  runApp(MyApp());
}
