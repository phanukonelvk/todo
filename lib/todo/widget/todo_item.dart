import 'package:flutter/material.dart';
import 'package:todo_example/todo/model/todo_model.dart';

class TodoItem extends StatelessWidget {
  final TodoModel? todo;
  final onToDoChanged;
  final onDeleteItem;
  const TodoItem({
    super.key,
    this.todo,
    this.onToDoChanged,
    this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onToDoChanged(todo);
      },
      leading: todo!.isCompleted!
          ? const Icon(Icons.check_box)
          : const Icon(Icons.check_box_outline_blank),
      trailing: IconButton(
        onPressed: () {
          onDeleteItem(todo!.id);
        },
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
      title: Text(
        todo!.todoName!,
        style: TextStyle(
            decoration: todo!.isCompleted! ? TextDecoration.lineThrough : null),
      ),
    );
  }
}
