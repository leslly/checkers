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

factory TodoModel.fromMap(Map<String, dynamic> json) => TodoModel(
    id: json['_id'],
    title: json['title'],
    createdAt: json['created_at'],
    isCompleted: json['is_completed'],
    description: json['description'],
    updatedAt: json['updated_at'],
);

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