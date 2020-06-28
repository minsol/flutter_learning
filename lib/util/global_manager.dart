import 'dart:ui';
class GlobalManager {
  /// 单例对象
  /// Dart中实现单例模式的标准做法就是使用static变量+工厂构造函数的方式。
  static GlobalManager _instance;
  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  GlobalManager._internal();


  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory GlobalManager.getInstance() => _getInstance();
  /// 获取单例内部方法
  static _getInstance() {
    // 只能有一个实例
    if (_instance == null) {
      _instance = GlobalManager._internal();
    }
    return _instance;
  }


}