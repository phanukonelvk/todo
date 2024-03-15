import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_example/todo/model/todo_model.dart';
import 'package:todo_example/todo/provider/state/todo_state.dart';

abstract class TodoCtrl {
  void addTodo(String todoName);

  void deleteTodo(int todoId);

  void updateStatus(int id, bool newStatus);

  void updateTodo(int id, String updateNew);

  void increase();

  void getTodoList() {}
}

class TodoNotifier extends StateNotifier<TodoState> implements TodoCtrl {
  @override
  TodoNotifier()
      : super(TodoState(
          index: 0,
          error: null,
          isLoading: false,
          todo: [],
        ));

  @override
  void addTodo(String todoName) {
    final newTodo = TodoModel(
      id: state.todo!.length + 1,
      todoName: todoName,
      isCompleted: false,
    );
    // final List<TodoModel> updateListTodo = List.from(state.todo!);
    // updateListTodo.add(newTodo);
    state = state.copyWith(todo: [...state.todo!, newTodo]);
  }

  @override
  void increase() {
    state = state.copyWith(index: state.index! + 1);
    state = state.copyWith(isLoading: false);
  }

  @override
  void getTodoList() {
    List<TodoModel> fetchingTodo = [
      // TodoModel(id: 1, todoName: "Hello MaMa", isCompleted: false),
      // TodoModel(id: 2, todoName: "Have a nice day", isCompleted: true)
    ];
    state = state.copyWith(todo: fetchingTodo);
  }

  @override
  void deleteTodo(int todoId) {
    final deleteItem =
        state.todo!.where((element) => element.id != todoId).toList();
    state = state.copyWith(todo: deleteItem);
  }

  @override
  void updateStatus(int id, bool newStatus) {
    final updatedTodoList = state.todo!.map((todo) {
      if (todo.id == id) {
        return todo.copyWith(isCompleted: newStatus);
      } else {
        return todo;
      }
    }).toList();
    state = state.copyWith(todo: updatedTodoList);
  }

  @override
  void updateTodo(int id, String updateNew) {
    final updateTodo = state.todo!.map((e) {
      if (e.id == id) {
        return e.copyWith(todoName: updateNew);
      } else {
        return e;
      }
    }).toList();
    state = state.copyWith(todo: updateTodo);
  }
}
