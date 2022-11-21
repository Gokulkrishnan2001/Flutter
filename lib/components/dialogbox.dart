import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:todo_app/components/buttons.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback   onSave;
  VoidCallback onCancel;
DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
    }
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(37, 39, 50, 1),
      content: Container(
        height: 130,
        child:Column(
          children: [
          //getting user input;
            TextField(
              controller: controller,
              cursorColor: Colors.white,
              decoration:
              InputDecoration(
                suffixIcon: Icon(Icons.keyboard_alt_outlined),
                  border:
                    GradientOutlineInputBorder(
                        gradient: LinearGradient(
                            colors: [Color.fromRGBO(1, 113, 255, 1),Color.fromRGBO(1, 113, 255, 1)]
                        )
                    ),
                  hintText: "Add New Task",
              ),
            ),
            Row(children: [
              //save
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 5,top: 5),
                child: SingButtons(onPressed:onSave, text: "Save"),
              ),
              //cancel
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 5,top: 5),
                child: SingButtons(onPressed:onCancel, text: "Cancel"),
              )
            ],)
        ],
        ),
      ),
    );
  }
}
