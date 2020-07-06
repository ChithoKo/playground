import 'package:flutter/material.dart';
// import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // final List<Tab> myTabs = <Tab>[
  //   Tab(text: 'LEFT'),
  //   Tab(text: 'RIGHT'),
  // ];

  // TabController _tabController;

  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(vsync: this, length: myTabs.length);
  // }

  @override
  Widget build(BuildContext context) {
    // _tabController = TabController(length: myTabs.length);

    return MaterialApp(
        title: 'Flutter 101',
        home: Scaffold(

          appBar: AppBar(
            title: Text(
              'Flutter getting started',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            // bottom: TabBar(
            //   controller: _tabController,
            //   tabs: myTabs,
            // ),
          ),
          // body: Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Text('hello'),
          //       Text('hello'),
          //     ]
          //   ),
          // ),
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            // itemBuilder: (context, i) {
            //   if (i.isOdd) return Divider(color: Colors.grey[50],);

            //   final index = i ~/ 2;

            //   if (index >= _suggestions.length) {
            //     _suggestions.addAll(generateWordPairs().take(10));
            //   }

            //   return _buildRow(_suggestions[index]);
            // },
            children: [
              Container(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.album),
                        title: Text('The Enchanted Nightingale'),
                        subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('BUY TICKETS'),
                            onPressed: () {/* ... */},
                          ),
                          FlatButton(
                            child: const Text('LISTEN'),
                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.album),
                        title: Text('The Enchanted Nightingale'),
                        subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('BUY TICKETS'),
                            onPressed: () {/* ... */},
                          ),
                          FlatButton(
                            child: const Text('LISTEN'),
                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0, // this will be set when a new tab is tapped
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.green,
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                title: new Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.mail),
                title: new Text('Messages'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile')
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text('Favorite')
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile')
              )
            ],
          ),
        ));
  }
}
