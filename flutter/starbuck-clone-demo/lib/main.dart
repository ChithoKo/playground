import 'package:flutter/material.dart';
import 'page2.dart';
// import 'dart:math';

// [TO-DOs]
// - How to set global variables?


void main() => runApp(SBApp());

class SBApp extends StatefulWidget {
  @override
  _SBApp createState() => _SBApp();
}

class _SBApp extends State<SBApp> {
  int _currentIndex = 2;
  
  @override
  Widget build(BuildContext context) {
    Widget widget = Page3();

    switch (_currentIndex) {
      case 0:
        widget = Page1();
        break;
      case 1:
        widget = Page2();
        break;
      case 2:
        widget = Page3();
        break;
      case 3:
        widget = Page4();
        break;
      case 4:
        widget = Page5();
        break;
    }

    return MaterialApp(
        title: 'Flutter 101',
        theme: ThemeData(
          canvasColor: Colors.white,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.grey[700])
          ),
          buttonTheme: ButtonThemeData(
            // padding: EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
            height: 30.0,
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Order',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: false,
            backgroundColor: Colors.white,
          ),
          body: widget,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex, // this will be set when a new tab is tapped
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.green,
            showUnselectedLabels: true,
            backgroundColor: Colors.red,
            onTap: (int i) {
              setState(() {
                _currentIndex = i;
              });
            },
            // type: BottomNavigationBarType.shifting,
            
            items: [
              BottomNavigationBarItem(
                icon: new Image.asset(
                  "assets/icons/star.png",
                  width: 36,
                  height: 48,
                ),
                title: new Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: new Image.asset(
                  "assets/icons/pay.png",
                  width: 36,
                  height: 48,
                ),
                title: new Text('Messages'),
              ),
              BottomNavigationBarItem(
                icon: new Image.asset(
                  "assets/icons/cup.png",
                  width: 36,
                  height: 48,
                ),
                title: Text('Profile')
              ),
              BottomNavigationBarItem(
                icon: new Image.asset(
                  "assets/icons/gift.png",
                  width: 36,
                  height: 48,
                ),
                title: Text('Favorite')
              ),
              BottomNavigationBarItem(
                icon: new Image.asset(
                  "assets/icons/store.png",
                  width: 36,
                  height: 48,
                ),
                title: Text('Profile')
              )
            ],
          ),
        )
    );
  }
}

