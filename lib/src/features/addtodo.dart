import 'package:flutter/material.dart';
import 'package:todo_app/src/features/add_todo_form.dart';

class AddTodo extends StatefulWidget {
  @override
  _AddTodo createState() => _AddTodo();
}

class _AddTodo extends State<AddTodo> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add Your Todo', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
            const SizedBox(height: 10,),
            TodoAddForm(onChangedTitle: (title)=>setState(() {
              
            }), onChangedDescription: (description)=>setState(() {
              
            }), onSavedTodo: (){}),
            // const SizedBox(height: 10,),
            // IconButton(onPressed: (){}, icon: Icon(Icons.post_add))
          ],
        ),
      );
}
