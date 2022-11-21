import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete_sweep,
            backgroundColor: Color.fromRGBO(214, 69, 65, 1),
              borderRadius: BorderRadius.circular(5),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent,width: 3),
              color: Color.fromRGBO(1, 113, 255, 1),
              borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            children:[
              //check box

              Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                activeColor: Colors.white,
                checkColor: Color.fromRGBO(1, 113, 255, 1),
              ),
              //task name
              Text(
                  taskName,
                style: TextStyle(
                    decoration: taskCompleted?
                    TextDecoration.lineThrough :TextDecoration.none,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
