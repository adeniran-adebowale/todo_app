import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/features/todo_widget.dart';
import 'package:todo_app/src/models/todo.dart';
import 'package:todo_app/src/services/provider_todo.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoList>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? Text(
            "No Todos At this time",
            style: TextStyle(fontSize: 20),
          )
        : 
              ListView.separated(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(5),shrinkWrap: true,
                separatorBuilder: (context, index) => Container(
                  height: 10,
                ),
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return TodoWidget(todo: todo);
                },
              );
          
  }
}
