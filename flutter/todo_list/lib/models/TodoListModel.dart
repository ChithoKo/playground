// import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todo_list/components/TodoListTile.dart';

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

  void hideAllItems () {
    _activeItemIdx = -1;

    notifyListeners();
  }
}