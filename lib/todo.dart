class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
});

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText:'Exercise', isDone: true),
      ToDo(id: '02', todoText:'Make lunch for office', isDone: true),
      ToDo(id: '03', todoText:'Finish work quota', isDone: true),
      ToDo(id: '04', todoText:'Have dinner', isDone: true),
      ToDo(id: '05', todoText:'Exercise', isDone: true),
    ];
  }

}