import 'dart:convert';
import 'package:checkers/add_todo.dart';
import 'package:checkers/todo_service/service.dart';
import 'package:checkers/utils/snackbar_helper.dart';
import 'package:checkers/widget/totdo_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.todo}) : super(key: key);

  final Map? todo;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isLoading = true;

  List items = [];

 @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text(
          'ToDo List',
        ),
      ),
      body: Visibility(
        visible: isLoading,
        replacement: RefreshIndicator(
          // pull down to refresh page and show new todo items
          onRefresh: fetchTodo,
          // this line of code will have an if-statement that will control the
          // interface of the todo list app to show a text saying no items yet
          child: Visibility(
            visible: items.isNotEmpty,
            replacement: Center(
              child: Text(
                'No todo items yet',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            child: ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: items.length,
                itemBuilder: (context, index) {
                final item = items[index] as Map;
                final id = item['_id'] as String;
              return TodoCard(
                  index: index,
                  item: item,
                  navigateEdit: navigateToEditPage,
                  deleteById: deleteById,
              );
            }),
          ),
        ),
        child: const Center(child: CircularProgressIndicator(),),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: navigateToAddPage,
          label: Text('Add Item'),
      ),
    );
  }

 Future<void> deleteById(String id) async {

   // Delete item (Request delete)
   final isSuccess = await TodoService.deleteById(id);

   if(isSuccess) {
     // Remove item from the list
     final filtered = items.where((element) => element['_id'] != id).toList();
     setState(() {
       items = filtered;
     });
   } else {
     // show error
     showErrorMessage( context, errorMessage: 'Cannot delete right now');
   }

  }

  Future<void> navigateToAddPage() async {
    // I don't really see the use of making a different route to navigate but
    // the navigation could have been done the normal way without this route
    final route = MaterialPageRoute(builder: (context) => AddToDo(),);
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

  Future<void> fetchTodo() async {
    final response = TodoService.fetchTodo();
    if(response !=null) {

      setState(() {
        items = response as List;
      });
    } else {
      showErrorMessage(context, errorMessage: 'Something went wrong');
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> navigateToEditPage(Map item) async { // I see the need of the route now
    // I don't really see the use of making a different route to navigate but
    // the navigation could have been done the normal way without this route
    final route = MaterialPageRoute(builder: (context) => AddToDo(todo: item),);
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

}

