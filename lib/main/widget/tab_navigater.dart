import 'package:flutter/material.dart';
import 'package:flutter_learning/main/pages/list_view.dart';
import 'package:flutter_learning/main/pages/state_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Color(0xff959595);
  final _activeColor = Color(0xff40A779);
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          MyStackPage(),
          ListViewWidget(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('images/tabbar_home_off.png',width: 22,height: 22,),
              activeIcon: Image.asset('images/tabbar_home_on.png',width: 22,height: 22,),
              title: Text(
                '首页',
                style: TextStyle(
                  color: _currentIndex != 0 ? _defaultColor : _activeColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/tabbar_info_off.png',width: 24,height: 24,),
              activeIcon: Image.asset('images/tabbar_info_on.png',width: 24,height: 24,),
              title: Text(
                '发现',
                style: TextStyle(
                  color: _currentIndex != 1 ? _defaultColor : _activeColor,
                ),
              ),
            ),
          ]),
    );
  }
}
