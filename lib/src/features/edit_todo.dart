import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/features/add_todo_form.dart';
import 'package:todo_app/src/models/todo.dart';
import 'package:todo_app/src/services/provider_todo.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditTodoForm extends StatelessWidget {
  late String id;
  late Todo todo;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  // ignore: use_super_parameters
  EditTodoForm(
      {Key? key,
      required String id,
      required this.onChangedTitle,
      required this.onChangedDescription,
      required this.onSavedTodo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoList>(context);

    void getTodo(id) {
      todo = provider.getTodoInfo(id);
    }

    getTodo(id);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          titleField(),
          const SizedBox(
            height: 10,
          ),
          descriptionField(),
          const SizedBox(
            height: 10,
          ),
          saveButton(),
        ],
      ),
    );
  }

  Widget titleField() => TextFormField(
        maxLines: 1,
        initialValue: todo.title,
        onChanged: onChangedTitle,
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
      );

  Widget descriptionField() => TextFormField(
        initialValue: todo.description,
        maxLines: 3,
        onChanged: onChangedDescription,
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
      );

  Widget saveButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
          ),
          onPressed: onSavedTodo,
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
}
