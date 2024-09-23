import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  // create todo list

  List toDoList = [];

  // open box
  final myBox = Hive.box("myBox");

  //   init data

  void createInitData() {
    toDoList = [
      ["get up", false],
      ['anythings', false]
    ];
  }

  void loadData() {
    toDoList = myBox.get("TODOLIST");
  }

  void updateData() {
    myBox.put("TODOLIST", toDoList);
  }
}
