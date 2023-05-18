 class TodoModel {

  final String id;
  final bool isCompleted;
  final String title;
  final String description;
  final String createdAt;
  final String updatedAt;

  const TodoModel({
   required this.id,
   required this.title,
   required this.createdAt,
   required this.isCompleted,
   required this.description,
   required this.updatedAt,
   });

  // This function will parse the JSON file from the API into our model
  /* What is the factory keyword ? A factory function is a function that returns
     an instance of a class. Dart provides factory keyword to label a default or
     named constructor. Then it becomes our responsibility to return an instance from
     this constructor. A factor constructor is generally used to control the instance creation.
   */

  factory TodoModel.fromMap(Map<String, dynamic> json) => TodoModel(
      id: json['_id'],
      title: json['title'],
      createdAt: json['created_at'],
      isCompleted: json['is_completed'],
      description: json['description'],
      updatedAt: json['updated_at'],
  );
// The values of the variable for the function above are in turn return to our variables in the map below
  Map<String, dynamic> toMap(){
   return {
    'id' : id,
    'title' : title,
    'description' : description,
    'createdAt' : createdAt,
    'isComplete' : isCompleted,
    'updatedAt' : updatedAt,
   };
  }



 }