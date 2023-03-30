import 'package:checkers/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({Key? key, required this.todo}) : super(key: key);

  final ToDo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white60,
        leading: Icon(
          Icons.check_box,
          color: CupertinoColors.activeBlue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle (
              color: CupertinoColors.black,
              fontSize: 16,
              decoration: TextDecoration.lineThrough
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
            width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () { },
          )
        ),
      ),
    );
  }
}
