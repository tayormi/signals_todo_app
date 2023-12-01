import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

final counter = signal(0);

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signals Todo App'),
      ),
      body: Watch((context) {
        return Center(
          child: Text('You have pushed the button ${counter.value} times:'),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
