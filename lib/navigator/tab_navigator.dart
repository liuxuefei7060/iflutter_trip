import 'package:flutter/material.dart';
import 'package:iflutter_trip/pages/home_page.dart';
import 'package:iflutter_trip/pages/my_page.dart';
import 'package:iflutter_trip/pages/search_page.dart';
import 'package:iflutter_trip/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({Key? key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  var _controller = PageController();
  var _currentIndex = 0;
  var _defaultColor = Colors.grey;
  var _activeColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.home,
                color: _activeColor,
              ),
              label: "首页"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.search,
                color: _activeColor,
              ),
              label: "搜索"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_alt,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.camera_alt,
                color: _activeColor,
              ),
              label: "旅拍"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.account_circle,
                color: _activeColor,
              ),
              label: "我的"),
        ],
      ),
      body: PageView(
        controller: _controller,
        children: [
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
    );
  }
}
