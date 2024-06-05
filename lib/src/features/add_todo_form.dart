import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class TodoAddForm extends StatelessWidget {
  final String title;
  final String description;
  final String category;

final TextEditingController controller;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final Function(String?) onCategoryChange;
  final VoidCallback onSavedTodo;


  const TodoAddForm(
      {Key? key,
      this.title = '',
      this.description = '',
      this.category = '',
required TextEditingController this.controller,
      required this.onChangedTitle,
      required this.onChangedDescription,
      required this.onCategoryChange,
      required this.onSavedTodo})
      : super(key: key);



  @override
  Widget build(BuildContext context) => Form(
    key: key,
    child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              titleField(controller),
              const SizedBox(
                height: 10,
              ),
              descriptionField(),
              const SizedBox(
                height: 10,
              ),
              categoryField(),
              const SizedBox(
                height: 10,
              ),
              saveButton(),
            ],
          ),
        ),
  );

  Widget titleField(TextEditingController t) => TextFormField(
        maxLines: 1,
       controller: t,
        //initialValue: title,
        onChanged: onChangedTitle,
        // controller: ,
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
        //controller: t,
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

  Widget categoryField() =>
      DropdownMenu(
        //controller: controller,
        dropdownMenuEntries: <DropdownMenuEntry<String>>[
        DropdownMenuEntry(value: "Health", label: "Health"),
        DropdownMenuEntry(value: "Work", label: "Work"),
        DropdownMenuEntry(value: "General", label: "General"),
        DropdownMenuEntry(value: "Business", label: "Business"),
        DropdownMenuEntry(value: "Finance", label: "Finance"),
        DropdownMenuEntry(value: "Family", label: "Family"),
        DropdownMenuEntry(value: "Education", label: "Education")
      ],
      onSelected: onCategoryChange,
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
