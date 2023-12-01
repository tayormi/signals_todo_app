import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:signals_todo_app/core/todo_store.dart';
import 'package:signals_todo_app/ui/add_todo_view.dart';

final name = signal("Signals Todo App");

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final header = computed(
        () => '${name.value} has ${todoStore.todos.value.length} todos');
    return Scaffold(
      appBar: AppBar(
        title: Watch((context) {
          return Text(name.value);
        }),
      ),
      body: Column(
        children: [
          Watch(
            (_) {
              return Center(
                child: Text(header.value),
              );
            },
          ),
          Watch(
            (_) {
              return ListView(
                shrinkWrap: true,
                children: [
                  for (final todo in todoStore.todos.value)
                    ListTile(
                      title: Text(
                        todo.title,
                        style: todo.completed
                            ? const TextStyle(
                                decoration: TextDecoration.lineThrough)
                            : null,
                      ),
                      subtitle: Text(
                        todo.description,
                        style: todo.completed
                            ? const TextStyle(
                                decoration: TextDecoration.lineThrough)
                            : null,
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => todoStore.remove(todo),
                      ),
                      onTap: () => todoStore.markAsCompleted(todo),
                    ),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => name.value = value,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const AddTodoView(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
