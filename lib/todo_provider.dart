import 'package:checkers/http_helper.dart';
import 'package:checkers/todo_model.dart';
import 'package:flutter/foundation.dart';

class TodoProvider extends ChangeNotifier {

 final HttpHelper _httpHelper = HttpHelper();

 List<TodoModel> _modelList = [];
 
 List<TodoModel> get modelList => [..._modelList];
 
 Future getTodos() async {
  try{

   final params = {
    'page' : '1',
    'limit' : '10'
   };
   final response = await _httpHelper.get(url: 'todos', queryParams: params);

   List<TodoModel> loadedData = [];

   final items = response.data['items'];


   for(int i = 0; i < items.length; i++){
    loadedData.add(TodoModel.fromMap(items[i]));
   }
   print(items);
   _modelList = loadedData;
   notifyListeners();
  }catch(e){
   if (kDebugMode) {
     print(e);
   }
  }
 }
 

 }
