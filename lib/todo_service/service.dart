import 'dart:convert';

import 'package:http/http.dart' as http;

// API is here

class TodoService {

  static Future<bool> deleteById(String id) async {
    // Delete item (Request delete)
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    return (response.statusCode == 200 || response.statusCode == 201);
  }

  static Future<List?> fetchTodo() async {
    final url = 'http://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if(response.statusCode == 201 || response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
      return result;
    } else {
      return null;
    }

  }
// update method
  static Future<bool> editTodo(String id, Map body) async {
    //submit data to server - post method - submit edited data
    final url = 'https://api.nstack.in/v1/todos/$id';
    // Universal Resource Locator
    final uri = Uri.parse(url);
    // Universal Resource Identifier
    final response = await http.put(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    return (response.statusCode == 200 || response.statusCode ==201);

    // create method
  } static Future<bool> addTodo( Map body) async {
    //submit data to server - post method
    final url = 'http://api.nstack.in/v1/todos';
    // Universal Resource Locator
    final uri = Uri.parse(url);
    // Universal Resource Identifier
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    return (response.statusCode == 200 || response.statusCode ==201);
  }

}
