import 'package:flutter/material.dart';

@immutable
class Todo {
  final String title;
  final String description;
  final bool completed;

  const Todo({
    required this.title,
    required this.description,
    this.completed = false,
  });

  Todo copyWith({
    String? title,
    String? description,
    bool? completed,
  }) {
    return Todo(
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }

  @override
  String toString() {
    return 'Todo{title: $title, description: $description, completed: $completed}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          completed == other.completed;

  @override
  int get hashCode =>
      title.hashCode ^ description.hashCode ^ completed.hashCode;
}
