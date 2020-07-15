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
  List<TodoItem> tdItems = <TodoItem>[
    TodoItem(title: 'hi there 2'),
    TodoItem(title: 'hi again 2'),
  ];

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
                child: new ListView.builder(
                  itemCount: tdItems.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return new TodoTile(todoItem: tdItems[index]);
                  }
                ),
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

class TodoItem {
  TodoItem({this.isExpanded, this.title, this.subTitle, this.note});

  final bool isExpanded;
  final String title;
  final String subTitle;
  final String note;
}

class TodoTile extends StatefulWidget {
  TodoTile({Key key, this.todoItem}) : super(key: key);

  final TodoItem todoItem;
  
  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool _exp = false;
  bool _chkboxStatus = false;

  Widget build (BuildContext context) {
    return ExpansionTile(
      key: Key('123'),
      // initiallyExpanded: false,
      title: Row(
        children: <Widget>[
          Checkbox(
            value: _chkboxStatus,
            onChanged: (bool newValue) {
              setState(() {
                _chkboxStatus = newValue;
              });
            },
          ),
          Flexible(
            child: Visibility (
              visible: !_exp,
              child: Container(
                child: Text(widget.todoItem.title ?? ''),
              ),
              replacement: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  // border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 6.0),
                  isDense: true,
                  hintText: 'New To-Do',
                ),
                controller: TextEditingController(text: widget.todoItem.title ?? '')
              ),
            )
          )
        ]
      ),
      trailing: Image.asset(
        "assets/images/spacer.png",
        width: 10,
        height: 10,
      ),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 62.0),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 6.0),
              hintText: 'Notes'
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 24.0),
          padding: EdgeInsets.symmetric(horizontal: 56.0),
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
      onExpansionChanged: (bool newValue) {
        setState(() {
          _exp = newValue;
        });
      }
    );
  }
}