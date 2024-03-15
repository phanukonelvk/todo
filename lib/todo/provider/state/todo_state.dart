import 'package:todo_example/todo/model/todo_model.dart';

class TodoState {
  final bool? _isLoading;
  final String? _error;
  final int? _index;
  final List<TodoModel>? _todo;

  TodoState({
    bool? isLoading,
    int? index,
    String? error,
    List<TodoModel>? todo,
  })  : _error = error,
        _index = index,
        _isLoading = isLoading,
        _todo = todo;

  bool? get isLoading => _isLoading;
  int? get index => _index;
  String? get error => _error;

  List<TodoModel>? get todo => _todo;

  TodoState copyWith({
    String? error,
    int? index,
    bool? isLoading,
    List<TodoModel>? todo,
  }) {
    return TodoState(
      index: index ?? _index,
      todo: todo ?? _todo,
      error: error ?? _error,
      isLoading: isLoading ?? _isLoading,
    );
  }
}
