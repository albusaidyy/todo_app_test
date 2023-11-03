import 'package:flutter/material.dart';

import '../models/dummy_data.dart';
import '../models/to_do_model.dart';

class ToDoItemProvider extends ChangeNotifier {
  List<ToDo> toDoList = dummyData;
  int indexToUpdate = -1;

  void addNewItem(String id, String title, bool isChecked) {
    dummyData.add(ToDo(id: id, title: title, isChecked: isChecked));
    notifyListeners();
  }

  //edit ToDoItem
  void editItem(ToDo toDo, String newTitle) {
    indexToUpdate = dummyData.indexWhere((item) => item.id == toDo.id);

    if (indexToUpdate != -1) {
      dummyData[indexToUpdate].title = newTitle;
    }
    notifyListeners();
  }

  void editDone(ToDo toDo) {
    indexToUpdate = dummyData.indexWhere((item) => item.id == toDo.id);
    if (indexToUpdate != -1) {
      dummyData[indexToUpdate].isChecked = !dummyData[indexToUpdate].isChecked;
    }
    notifyListeners();
  }
}
