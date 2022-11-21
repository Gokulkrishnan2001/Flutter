import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:todo_app/components/dialogbox.dart';
import 'package:todo_app/database/dataBase.dart';
import '../components/ToDoList.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _handle() async{
    return await Future.delayed(Duration(milliseconds: 1200));
  }
  // hive
  final _mybox = Hive.box('box');
  @override
  void initState() {
    if(_mybox.get("TODOLIST")== null)
      {
        db.createInitialdata();
      }
    else{
      db.loadData();
    }

    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  //list of todo task
  //List toDoList = [];
  AppDataBase db = AppDataBase();

  // check box tapped
  void checkboxChanged(bool? value,int index){
      setState(() {
        db.toDoList[index][1] = !db.toDoList[index][1];
      });
      db.updateData();
  }

  // on save process
  void SaveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void Cancel(){
    setState(() {
      _controller.clear();
      Navigator.of(context).pop();
       }
    );
    db.updateData();
  }

  // create a new task on pressed basically allertbox
  void createNewTask(){
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller:_controller,
          onCancel: Cancel,
          onSave: SaveNewTask,

        );
    },
    );
  }
// delete task
  void deleteTask(int index,) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 55, 65, 1),
      appBar: AppBar(
        scrolledUnderElevation: 15,
        backgroundColor: Color.fromRGBO(1, 113, 255, 1),
        title: Text('TO DO ',style: GoogleFonts.inder(fontWeight: FontWeight.w600),),
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(1, 113, 255, 1),
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body:
      LiquidPullToRefresh(
        onRefresh: _handle,
        color: Color.fromRGBO(1, 113, 255, 1),
        height: 150,
        backgroundColor: Color.fromRGBO(50, 55, 65, 1),
        animSpeedFactor: 2,
        showChildOpacityTransition: false,
        child: ListView.builder(

          itemCount: db.toDoList.length,
          itemBuilder: (context, index){
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkboxChanged(value ,index),
              deleteFunction:(context) => deleteTask(index) ,
            );
          }
        ),
      ),
    );
  }
}
