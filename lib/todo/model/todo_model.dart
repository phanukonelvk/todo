class TodoModel {
   int? id;
   String? todoName;
   bool? isCompleted;

  TodoModel({
    this.id,
    this.todoName,
    this.isCompleted = false,
  });

  TodoModel copyWith({
    int? id,
    String? todoName,
    bool? isCompleted,
  }) {
    return TodoModel(
      id: id ?? this.id,
      todoName: todoName ?? this.todoName,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
