import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoAddForm extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  const TodoAddForm(
      {Key? key,
      this.title = '',
      this.description = '',
      required this.onChangedTitle,
      required this.onChangedDescription,
      required this.onSavedTodo})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
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

  Widget titleField() => TextFormField(
        maxLines: 1,
        initialValue: title,
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
        initialValue: description,
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
          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),),
          onPressed: onSavedTodo,
          child:const Text('Save',style: TextStyle(color: Colors.white),),
        ),
      );
}
