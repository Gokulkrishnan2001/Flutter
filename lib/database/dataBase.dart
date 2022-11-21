import 'package:hive_flutter/adapters.dart';

class AppDataBase{
  List toDoList = [];
  final _mybox = Hive.box('box');
  void createInitialdata()
  {
  }
  void loadData(){
    toDoList = _mybox.get("TODOLIST");
  }

  void updateData(){
    _mybox.put("TODOLIST",toDoList);
  }
}