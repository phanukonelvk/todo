import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_example/todo/provider/state/todo_notifier.dart';
import 'package:todo_example/todo/provider/state/todo_state.dart';

final todoStateNotifier = StateNotifierProvider<TodoNotifier, TodoState>(
  (ref) => TodoNotifier(),
);
