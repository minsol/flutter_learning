import 'package:flutter_learning/main/pages/list_view.dart';
import 'package:flutter_learning/util/log_util.dart';
import 'package:flutter_learning/util/navigator_util.dart';
import 'package:flutter_learning/util/size_fit.dart';
import 'package:flutter_learning/main/pages/second_page.dart';
import 'package:flutter_learning/main/widget/list_item.dart';
import 'package:flutter/material.dart';

class MyStackPage extends StatefulWidget {
  ///1. 执行 StatefulWidget 的构造函数（Constructor）来创建出 StatefulWidget
  MyStackPage(){
    LogUtil.v("执行 StatefulWidget 的"+" Constructor "+'\n');
  }
  ///2. 执行 StatefulWidget 的createState方法，来创建一个维护 StatefulWidget 的State对象；
  @override
  _MyStackPageState createState() {
    LogUtil.v("执行 StatefulWidget 的"+" createState "+'\n');
    return _MyStackPageState();
  }
}

class _MyStackPageState extends State<MyStackPage> with WidgetsBindingObserver implements SecondFlutterWidgetDelegate{
  List<String> dataSourceList = ['传值'];

  /// 3. 执行 State 类的构造方法（Constructor）来创建State对象
  _MyStackPageState() {
    LogUtil.v("执行 State 的" + " Constructor " + '\n');
  }

  /// 4.执行initState，我们通常会在这个方法中执行一些数据初始化的操作，或者也可能会发送网络请求；
  ///
  /// 注意：这个方法是重写父类的方法，必须调用super，因为父类中会进行一些其他操作；
  /// 并且如果你阅读源码，你会发现这里有一个注解（annotation）：@mustCallSuper
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    LogUtil.v("执行 State 的" + " initState " + '\n');
  }

  ///5. 这个方法在两种情况下会调用
  ///
  /// 情况一：调用initState会调用；
  ///情况二：从其他对象中依赖一些数据发生改变时，比如前面我们提到的 InheritedWidget（这个后面会讲到）
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    LogUtil.v("执行 State 的" + " didChangeDependencies " + '\n');
  }

  /// 6. Flutter执行build方法，来看一下我们当前的Widget需要渲染哪些Widget；
  ///
  /// 手动调用setState方法，会根据最新的状态（数据）来重新调用build方法，构建对应的Widgets；
  @override
  Widget build(BuildContext context) {
    // 初始化SizeFit
    SizeFit.initialize(context);
    LogUtil.v("执行 State 的" + " build " + '\n');
    return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
        ),
        body: Center(
          child: ListView.builder(itemCount: dataSourceList.length, itemBuilder: buildItem),
        ),
    );
  }

  ///7. 当前的Widget不再使用时，会调用dispose进行销毁
  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    LogUtil.v("执行 State 的" + " dispose " + '\n');
  }

  ///8. 执行didUpdateWidget方法是在当父Widget触发重建（rebuild）时，系统会调用 didUpdateWidget 方法；
  @override
  void didUpdateWidget(MyStackPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    LogUtil.v("执行 State 的" + " didUpdateWidget ");
  }

  ///9. 组件被移除
  @override
  void deactivate() {
    super.deactivate();
    LogUtil.v("执行 State 的" + " deactivate ");
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        LogUtil.v('AppLifecycleState.inactive');
        break;
      case AppLifecycleState.paused:
        LogUtil.v('AppLifecycleState.paused');
        break;
      case AppLifecycleState.resumed:
        LogUtil.v('AppLifecycleState.resumed');
        break;
      case AppLifecycleState.detached:
        LogUtil.v('AppLifecycleState.detached');
        break;
    }

    super.didChangeAppLifecycleState(state);
  }


  //ListView的Item
  Widget buildItem(BuildContext context, int index) {
    return new GestureDetector(
      onTap: () async {
        //处理点击事件
        if (index == 0) {
          final result = await Navigator.push(context, MaterialPageRoute(
              builder: (context) =>
                  SecondFlutterWidget(titleString: '这是传过来的参数',
                    callBackFunction: onPress,
                    callBackDelegate: this,)));
          LogUtil.v(result);
          reloadList(result);
        }
      },
      child: new Container(
        child: ListViewItem(dataSourceList[index]),
      ),
    );
  }

  //第二种
  void onPress(String result) {
    reloadList(result);
    LogUtil.v(result);
  }


  void reloadList(String string) {
    if (mounted)
      setState(() {
        dataSourceList.add(string);
      });
  }

  @override
  void onCallback(String result) {
    reloadList(result);
    LogUtil.v(result);
  }
}