import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todo_list/models/TodoListModel.dart';
import 'package:todo_list/components/TodoListTile.dart';
import 'package:expandable/expandable.dart';

void main() {
  runApp(MyApp(
    model: TodoListModel()
  ));
}

class MyApp extends StatelessWidget {
  final TodoListModel model;

  const MyApp({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<TodoListModel>(
      model: model,
      child: MaterialApp(
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
      )
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
                child: ScopedModelDescendant<TodoListModel>(
                  builder: (context, child, model) {
                    return GestureDetector(
                      onTap: () {
                        model.hideAllItems();
                      },
                      child: ListView.builder(
                        itemCount: model.tdItems.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return new TodoListTile(todoItem: model.tdItems[model.tdItems.length - 1 - index], itemIndex: (model.tdItems.length - 1 - index));
                        }
                      )
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 45.0,
        height: 45.0,
        child: ScopedModelDescendant<TodoListModel>(
          builder: (context, child, model) {
            return FittedBox(
              child: FloatingActionButton(
                elevation: 0.0,
                onPressed: (){
                  model.insertNewItem();
                },
                tooltip: 'Increment',
                child: Icon(
                  Icons.add,
                  size: 45.0
                ),
              ),
            );
          }
        )
      )
    );
  }
}