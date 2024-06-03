import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/models/todo.dart';
import 'package:todo_app/src/services/provider_todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    required this.todo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoList>(context);

    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.white,
      child: Row(
        children: [
          Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              value: todo.isCompleted,
              onChanged: (onChanged) {
                Todo newTodo = Todo(
                    title: todo.title,
                    createdTime: DateTime.now(),
                    isCompleted: !todo.isCompleted);
                provider.editTodo(todo, newTodo);
              }),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(todo.title),
              
            ],
          )),
          const SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () => showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      String id = todo.id;
                      String tl = todo.title;
                      String dc = todo.description;
                      Todo newTodo =
                          Todo(title: "", createdTime: todo.createdTime);

                      return AlertDialog(
                          title: Text("Edit todo"),
                          content: Text(dc),
                          actions: <Widget>[
                            // EditTodoForm(
                            //     id: todo.id,
                            //     onChangedTitle: (tl) {},
                            //     onChangedDescription: (dc) {},
                            //     onSavedTodo: () {}),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    maxLines: 1,
                                    initialValue: todo.title,
                                    onChanged: (title) {
                                      newTodo.title =
                                          title == '' ? todo.title : title;
                                    },
                                    validator: (title) {
                                      if (title == '') {
                                        return 'The Title must be filled...';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Title',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    initialValue: todo.description,
                                    maxLines: 3,
                                    onChanged: (description) {
                                      newTodo.description = description == ''
                                          ? todo.description
                                          : description;
                                    },
                                    validator: (description) {
                                      if (description == '') {
                                        return 'Kindly Describe the description field...';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Description',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll<Color>(
                                                Colors.purple),
                                      ),
                                      onPressed: () {
                                        newTodo.id = todo.id;
                                        newTodo.isCompleted = todo.isCompleted;
                                        newTodo.isStarred = todo.isStarred;
                                        if (newTodo.id == todo.id) {
                                          provider.editTodo(todo, newTodo);
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: const Text(
                                        'Save',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]);
                    },
                  ),
              icon: Icon(
                Icons.edit,
                color: Colors.purple[900],
              )),
          const SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () {
                Todo newTodo = Todo(
                    title: todo.title,
                    createdTime: DateTime.now(),
                    isStarred: !todo.isStarred,
                    description: todo.description,
                    isCompleted: todo.isCompleted);
                provider.editTodo(todo, newTodo);
              },
              icon: todo.isStarred
                  ? Icon(
                      Icons.star,
                      color: Colors.amber[700],
                    )
                  : Icon(Icons.star)),
          const SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () {
                provider.deleteTodo(todo);
              },
              icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
