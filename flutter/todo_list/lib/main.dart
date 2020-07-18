import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

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
  List<TodoItem> tdItems0 = <TodoItem>[
    TodoItem(title: 'hi there'),
    TodoItem(title: 'hi again'),
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
                child: ScopedModelDescendant<TodoListModel>(
                  builder: (context, child, model) {
                    return GestureDetector(
                      onTap: () {
                        model.expandItem(-1);
                      },
                      // color: Colors.grey,
                      child: ListView.builder(
                        itemCount: model.tdItems.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return new TodoTile(todoItem: model.tdItems[model.tdItems.length - 1 - index], itemIndex: (model.tdItems.length - 1 - index));
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

class TodoItem {
  bool isExpanded;
  String title;
  String subTitle;
  String note;

  TodoItem({this.isExpanded = false, this.title = '', this.subTitle = '', this.note = ''});
}

class TodoTile extends StatefulWidget {
  TodoTile({Key key, this.todoItem, this.itemIndex}) : super(key: key);

  final TodoItem todoItem;
  final int itemIndex;
  
  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  // bool _exp = false;
  bool _chkboxStatus = false;
  // final titleController = TextEditingController(text: 'hi there');
  final titleController = TextEditingController();
  final noteController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();

  //   titleController.addListener(_printLatestValue);
  //   noteController.addListener(_printLatestValue);
  // }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  // _printLatestValue() {
  //   print("Second text field: ${txtController.text}");
  // }

  Widget build (BuildContext context) {
    // titleController.text = (titleController.text == '') ? widget.todoItem.title ?? '' : titleController.text;
    titleController.text = widget.todoItem.title;
    noteController.text = widget.todoItem.note;

    return ScopedModelDescendant<TodoListModel>(
      builder: (context, child, model) {
        return ExpansionTile(
          key: Key("item${widget.itemIndex}-${widget.itemIndex == model.activeItemIdx}"),
          initiallyExpanded: widget.itemIndex == model.activeItemIdx,
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
                  visible: widget.itemIndex != model.activeItemIdx,
                  child: Container(
                    child: Text(widget.todoItem.title == '' ? 'New To-Do' : widget.todoItem.title),
                    // child: Text('New To-Do'),
                  ),
                  replacement: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 6.0),
                      isDense: true,
                      hintText: 'New To-Do',
                    ),
                    controller: titleController,
                    onChanged: (text) {
                      // model.updateItem(widget.itemIndex, title: text);
                    }
                  ),
                )
              )
            ]
          ),
          trailing: Container(
            height: 1.0,
            width: 1.0,
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
                controller: noteController,
                onChanged: (text) {
                  // model.updateItem(widget.itemIndex, note: text);
                }
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
            // setState(() {
            //   _exp = newValue;
            // });
            model.updateItem(widget.itemIndex, title: titleController.text, note: noteController.text);
            if (widget.itemIndex == model.activeItemIdx) { model.expandItem(-1); }
            else { model.expandItem(widget.itemIndex); }
            
          }
        );
      },
    );
  }
}

class TodoListModel extends Model {
  List<TodoItem> _tdItems = <TodoItem>[
    TodoItem(title: 'Todo Item 1'),
    TodoItem(title: 'Todo Item 2'),
  ];
  int _activeItemIdx = -1;

  // [TO-DO]: Find out why use get & _?
  List<TodoItem> get tdItems => _tdItems;
  int get activeItemIdx => _activeItemIdx;
  // int set activeItemIdx => _activeItemIdx;

  void insertNewItem () {
    _tdItems.add(TodoItem(isExpanded: true));
    _activeItemIdx = _tdItems.length - 1;

    notifyListeners();
  }

  void updateItem (int index, {String title = null, String subTitle = null, String note = null}) {
    
    _tdItems[index].title = title ?? _tdItems[index].title;
    _tdItems[index].subTitle = subTitle ?? _tdItems[index].subTitle;
    _tdItems[index].note = note ?? _tdItems[index].note;

    notifyListeners();
  }

  void expandItem (int index) {
    _activeItemIdx = index;

    notifyListeners();
  }
}