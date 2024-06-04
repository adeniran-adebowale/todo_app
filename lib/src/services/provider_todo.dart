import 'package:flutter/material.dart';
import 'package:todo_app/src/models/todo.dart';
import 'package:uuid/uuid.dart';

class TodoList with ChangeNotifier {
  List<Todo> _todoList = [
    Todo(id: Uuid().v4(), title: 'Boil Rice', createdTime: DateTime.now(), category: "Health"),
    Todo(id: Uuid().v4(), title: 'Jog for 1 hour', createdTime: DateTime.now(),category: "Health"),
    Todo(
        id: Uuid().v4(),
        title: 'Jog for 2 hours',
        createdTime: DateTime.now(),
        isStarred: true,category: "Health"),
         Todo(id: Uuid().v4(), title: 'Build a Gant Chart', createdTime: DateTime.now(), category: "Work"),
    Todo(id: Uuid().v4(), title: 'Follow Up with the Rehearsal Team', createdTime: DateTime.now(),category: "Work"),
    Todo(
        id: Uuid().v4(),
        title: 'Meet with Head of Operations',
        createdTime: DateTime.now(),
        isStarred: true,category: "Work"),
         Todo(id: Uuid().v4(), title: 'Finish the App Task', createdTime: DateTime.now(), category: "Personal"),
    Todo(id: Uuid().v4(), title: 'Watch the Movie', createdTime: DateTime.now(),category: "Personal"),
    Todo(
        id: Uuid().v4(),
        title: 'Read the Mastery Art',
        createdTime: DateTime.now(),
        isStarred: true,category: "Personal")
  ];

  List<Todo> get todos =>
      _todoList.where((todo) => todo.isCompleted == false).toList();
  List<Todo> get favorite_todos => _todoList
      .where((todo) => todo.isStarred == true && todo.isCompleted == false)
      .toList();
  List<Todo> get completed_todos =>
      _todoList.where((todo) => todo.isCompleted == true).toList();

  void addTodoToList(Todo todo) {
    _todoList.add(todo);
    notifyListeners();
  }

  void editTodo(Todo oldTodo, Todo updatedTodo) {
    int index = getIndex(oldTodo);

    _todoList[index].title = updatedTodo.title;
    _todoList[index].description = updatedTodo.description;
    _todoList[index].isCompleted = updatedTodo.isCompleted;
    _todoList[index].isStarred = updatedTodo.isStarred;

    notifyListeners();
  }

  void deleteTodo(Todo toDelete) {
    int index = getIndex(toDelete);

    if (index != -1) {
      _todoList.removeAt(index);
    }

    notifyListeners();
  }

  Todo getTodoInfo(String id) {
    for (var element in _todoList) {
      if (element.id == id) {
        return element;
      }
    }

    return Todo(title: "Empty", createdTime: DateTime.now());
  }

  int getIndex(Todo obj) {
    int index = 0;
    for (var element in _todoList) {
      if (obj.id == element.id) {
        return index;
      }

      index++;
    }

    return -1;
  }
}
