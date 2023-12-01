import 'package:flutter/material.dart';
import 'package:signals_todo_app/core/models/todo.dart';
import 'package:signals_todo_app/core/todo_store.dart';

class AddTodoView extends StatefulWidget {
  const AddTodoView({super.key});

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                todoStore.add(
                  Todo(
                    title: _titleController.text,
                    description: _descriptionController.text,
                  ),
                );
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
