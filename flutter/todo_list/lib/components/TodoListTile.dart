import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todo_list/models/TodoListModel.dart';
import 'package:expandable/expandable.dart';

class TodoListTile extends StatefulWidget {
  TodoListTile({Key key, this.todoItem, this.itemIndex}) : super(key: key);

  final TodoItem todoItem;
  final int itemIndex;
  
  @override
  _TodoListTileState createState() => _TodoListTileState();
}

class _TodoListTileState extends State<TodoListTile> {
  bool _chkboxStatus = false;
  final titleController = TextEditingController();
  final noteController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  Widget build (BuildContext context) {
    titleController.text = widget.todoItem.title;
    noteController.text = widget.todoItem.note;

    return ScopedModelDescendant<TodoListModel>(
      builder: (context, child, model) {
        return ExpansionTile(
          key: Key("item${widget.itemIndex}-${widget.itemIndex == model.activeItemIdx}"),
          initiallyExpanded: widget.itemIndex == model.activeItemIdx,
          trailing: Container(
            height: 1.0,
            width: 1.0,
          ),
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
                      model.updateItem(widget.itemIndex, title: text);
                    }
                  ),
                )
              )
            ]
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
                  model.updateItem(widget.itemIndex, note: text);
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
            model.updateItem(widget.itemIndex, title: titleController.text, note: noteController.text);

            if (widget.itemIndex == model.activeItemIdx) { model.hideAllItems(); }
            else { model.expandItem(widget.itemIndex); }
          }
        );
      },
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