import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        canvasColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: IconThemeData(size: 36.0),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0.0,
        leading: IconButton(
          iconSize: Theme.of(context).iconTheme.size,
          icon: const Icon(
            Icons.chevron_left,
          )
        ),
        actions: <Widget>[
          IconButton(
            iconSize: Theme.of(context).iconTheme.size,
            icon: const Icon(
              Icons.expand_more,
            )
          )
        ]
      ),
      body: Center(
        child: Column(
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  iconSize: Theme.of(context).iconTheme.size,
                  icon: const Icon(
                    Icons.grade,
                    color: Colors.yellow
                  )
                ),
                Text('Today', style: Theme.of(context).textTheme.headline1),
              ]
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: ListView(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Checkbox(
                          value: false,
                          // onChanged: (bool newValue) {
                          //   setState(() {
                          //     _value = newValue;
                          //   });
                          // },
                        ),
                        Flexible(
                          child: ExpansionTile(
                            key: Key('123'),
                            initiallyExpanded: true,
                            title: Visibility (
                              visible: false,
                              child: Container(
                                child: Text('New To-Do')
                              ),
                              replacement: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  // border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(vertical: 6.0),
                                  isDense: true,
                                  hintText: 'New To-Do',
                                ),
                                controller: TextEditingController(text: 'Initial value')
                              ),
                            ),
                            trailing: Image.asset(
                              "assets/images/spacer.png",
                              width: 10,
                              height: 10,
                            ),
                            children: <Widget>[
                              TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(vertical: 6.0),
                                  hintText: 'Notes'
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 24.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.grade,
                                      size: 24.0,
                                      color: Colors.yellow
                                    ),
                                    Text('Today', style: Theme.of(context).textTheme.bodyText2),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )
              )
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 45.0,
        height: 45.0,
        child: FittedBox(
          child: FloatingActionButton(
            elevation: 0.0,
            onPressed: (){},
            tooltip: 'Increment',
            child: Icon(
              Icons.add,
              size: 45.0
            ),
          ),
        )
      )
    );
  }
}
