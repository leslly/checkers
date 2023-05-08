import 'dart:convert';
import 'package:checkers/todo_service/service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
/* The http import is necessary for communication between the remote service ( the API ) and
*  the part of the code that will make request from the API for the API to be executed.
*
*  Our URL endpoint which is our API is rewuested by the http - check ln102 0f
*  this fle to see code
*  If we successfully hit the end-point, status cde == 200 == success */
class AddToDo extends StatefulWidget {
 // const AddToDo({Key? key}) : super(key: key);
  const AddToDo({super.key, this.todo});

  final Map? todo;

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    final todo = widget.todo;
    if(todo != null) {
      isEditing = true;
      final title = todo['title'];
      final description = todo['description'];
      titleController.text = title;
      descriptionController.text = description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          isEditing? 'Edit Todo'  : 'Add ToDo',
        ),
        elevation: 1,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Title',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(hintText: 'Description'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: isEditing? editData : submitData,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
               isEditing? 'Edit' : 'Add',
              ),
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   margin: EdgeInsets.only(bottom: 20),
    //   child: ListTile(
    //     contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
    //     onTap: () {},
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(20),
    //     ),
    //     tileColor: Colors.white60,
    //     leading: Icon(
    //       Icons.check_box,
    //       color: CupertinoColors.activeBlue,
    //     ),
    //     title: Text(
    //       widget.todo.todoText!,
    //       style: TextStyle (
    //           color: CupertinoColors.black,
    //           fontSize: 16,
    //           decoration: TextDecoration.lineThrough
    //       ),
    //     ),
    //     trailing: Container(
    //       padding: EdgeInsets.all(0),
    //       margin: EdgeInsets.symmetric(vertical: 12),
    //       height: 35,
    //         width: 35,
    //       decoration: BoxDecoration(
    //         color: Colors.red,
    //         borderRadius: BorderRadius.circular(5),
    //       ),
    //       child: IconButton(
    //         color: Colors.white,
    //         iconSize: 18,
    //         icon: Icon(Icons.delete),
    //         onPressed: () { },
    //       )
    //     ),
    //   ),
    // );
  }

  Future<void> editData() async {
    // put method
    final todo = widget.todo;
    if(todo == null) {
      print('You cannot call updated without todo data');
      return;
    }
    final id = todo['_id'];
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false,
    };

    //submit data to server - post method - submit edited data
    final isSuccess = await TodoService.editTodo(id, body);

    // show success or error via snack bar
    if (isSuccess) {
      showSuccessMessage('Edit Success');
    } else {
      showErrorMessage('Edit Failed');
    }
  }

 Future<void> submitData() async {

    // Get data from form - get method
  final title = titleController.text;
  final description = descriptionController.text;
  final body = {
    "title": title,
    "description": description,
    "is_completed": false
  };

    //submit data to server - post method
    final isCreate = await TodoService.addTodo(body);

    // show success or error via snack bar
   if (isCreate) {
     titleController.text = '';
     descriptionController.text = '';
    showSuccessMessage('Success');
   } else {
    showErrorMessage('Failed');
   }
  }
  
  void showSuccessMessage(String message) {
    final snackBar = SnackBar(content: Text(message), backgroundColor: Colors.greenAccent,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorMessage(String errorMessage) {
    final snackBar = SnackBar(
        content: Text(errorMessage), backgroundColor: Colors.redAccent.withOpacity(0.1),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
