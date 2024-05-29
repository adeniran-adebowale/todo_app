import 'package:flutter/material.dart';
import 'package:todo_app/src/models/todo.dart';

class TodoList with ChangeNotifier{
List<Todo> _todoList=[Todo(title: 'Boil Rice', createdTime: DateTime.now()),Todo(title: 'Jog for 1 hour', createdTime: DateTime.now()),Todo(title: 'Jog for 1 hour', createdTime: DateTime.now(),isStarred: true)];




List<Todo> get todos=> _todoList.where((todo)=> todo.isCompleted==false).toList();
List<Todo> get favorite_todos=> _todoList.where((todo)=> todo.isStarred==true && todo.isCompleted==false).toList();
List<Todo> get completed_todos=> _todoList.where((todo)=> todo.isCompleted==true).toList();

updateList(){

}


}