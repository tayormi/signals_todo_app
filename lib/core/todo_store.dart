import 'package:signals/signals.dart';
import 'package:signals_todo_app/core/models/todo.dart';

final todoStore = TodoStore();

class TodoStore {
  final todos = <Todo>[].toSignal();

  void add(Todo todo) {
    todos.value = [...todos.value, todo];
  }

  void remove(Todo todo) {
    todos.value = todos.value.where((t) => t != todo).toList();
  }

  void markAsCompleted(Todo todo) {
    todos.value = todos.value.map((t) {
      if (t == todo) {
        return t.copyWith(completed: true);
      }
      return t;
    }).toList();
  }
}
