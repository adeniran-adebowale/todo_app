import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/features/add_todo_form.dart';
import 'package:todo_app/src/features/edit_todo.dart';
import 'package:todo_app/src/models/todo.dart';
import 'package:todo_app/src/services/provider_todo.dart';
import 'package:uuid/uuid.dart'; 

class EditTodo extends StatefulWidget {
  final String id;
  

const EditTodo(this.id, {super.key});

  

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {

late EditTodo td;


_EditTodoState(this.td):super();
  @override
  Widget build(BuildContext context) {
    
final provider = Provider.of<TodoList>(context);

    
    return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Edit Your Todo', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),

            const SizedBox(height: 10,),
           
          EditTodoForm(id:_id, onChangedTitle: (onChangedTitle){}, onChangedDescription: (onChangedDescription){}, onSavedTodo: (){}),
            // TodoAddForm(onChangedTitle: (title)=>setState(() {
            //   this.title=title;
            // }), onChangedDescription: (description)=>setState(() {
            //   this.description=description;
            // }), onSavedTodo: (){

            //   if(title!='' && description!=''){
            //     provider.addTodoToList(Todo(id: id, title: title,description: description, createdTime: DateTime.now()));
            //     Navigator.pop(context);
            //   }

              

            // }),
            // const SizedBox(height: 10,),
            // IconButton(onPressed: (){}, icon: Icon(Icons.post_add))
          ],
        ),
      );

  }
}

