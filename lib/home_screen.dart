import 'package:checkers/todo_provider.dart';
import 'package:checkers/widget/totdo_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.todo}) : super(key: key);

  final Map? todo;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isLoading = false;

  List items = [];

 @override
  void initState() {
    super.initState();
  }

  _getTodo() async {
   setState(() {
     isLoading = true;
   });
   await Provider.of<TodoProvider>(context, listen: false).getTodos();
   setState(() {
     isLoading = false;
   });
  }

  @override
  void didChangeDependencies(){
   _getTodo();
   super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
   final todos = Provider.of<TodoProvider>(context, listen: false).modelList;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text(
          'ToDo List',
        ),
      ),
      body: todos.isEmpty ? const Center(child: CircularProgressIndicator(color: Colors.blue,),) :  Visibility(
        visible: todos.isNotEmpty,
        replacement: Center(
          child: Text(
            'No todo items yet',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        child: ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return TodoCard(
                  index: index,
                  item: todos[index]
              );
            }),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){

          },
          label: Text('Add Item'),
      ),
    );
  }

}

