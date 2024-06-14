import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_example/core/shared/localexaple/loacal_data.dart';
import 'package:todo_example/todo/model/todo_model.dart';
import 'package:todo_example/todo/provider/todo_provider.dart';
import 'package:todo_example/widgets/app_textstyles.dart';

class TodoScreen extends ConsumerStatefulWidget {
  const TodoScreen({super.key});

  @override
  ConsumerState<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends ConsumerState<TodoScreen> {
  List<TodoModel> todoList = [];
  final String email = '';

  void handleToDoChange(TodoModel todo) {
    setState(() {
      todo.isCompleted = !todo.isCompleted!;
    });
  }

  // void _addItem(String todoAddName) {
  //   setState(() {
  //     todoList.add(
  //       TodoModel(
  //         id: DateTime.now().millisecondsSinceEpoch,
  //         todoName: todoAddName,
  //       ),
  //     );
  //     todoText.clear();
  //   });
  //   todoText.clear();
  // }

  void _deleteItem(int id) {
    setState(() {
      todoList.removeWhere((element) => element.id == id);
    });
  }

  Future<void> _displayDialog({bool? isType, String? isUpdate, int? id}) async {
    final TextEditingController todoText =
        TextEditingController(text: isType! ? '' : isUpdate);
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a todo'),
          content: TextField(
            controller: todoText,
            decoration: const InputDecoration(
                hintText: 'Type your todo', border: InputBorder.none),
            autofocus: true,
          ),
          actions: <Widget>[
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                if (isType) {
                  ref.read(todoStateNotifier.notifier).addTodo(todoText.text);
                  todoText.clear();
                } else {
                  ref
                      .read(todoStateNotifier.notifier)
                      .updateTodo(id!, todoText.text);
                }
                // _addItem(todoText.text);
              },
              child: Text(isType ? 'Add' : 'update'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    Future(() => ref.read(todoStateNotifier.notifier).getTodoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(todoStateNotifier);
    final notifier = ref.read(todoStateNotifier.notifier);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          _displayDialog(
            isType: true,
          );
          LocalData.clearLocalStorage();
          // notifier.increase();
        },
        child: const Icon(Icons.add),
      ),
      body: state.todo!.isEmpty
          ? Center(
              child: Text("What are you thinking! ",
                  style: AppTextStyles.titleLarge!),
            )
          : ListView.builder(
              itemCount: state.todo!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    _displayDialog(
                        isType: false,
                        isUpdate: state.todo![index].todoName,
                        id: state.todo![index].id);
                  },
                  leading: Checkbox(
                    value: state.todo![index].isCompleted,
                    onChanged: (value) =>
                        notifier.updateStatus(state.todo![index].id!, value!),
                  ),
                  title: Text(
                    state.todo![index].todoName!,
                    style: TextStyle(
                        decoration: state.todo![index].isCompleted!
                            ? TextDecoration.lineThrough
                            : null),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      notifier.deleteTodo(state.todo![index].id!);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            ),
    );
  }
}
