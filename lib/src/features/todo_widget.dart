
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/features/edit_todo.dart';
import 'package:todo_app/src/models/todo.dart';
import 'package:todo_app/src/services/provider_todo.dart';

class TodoWidget extends StatelessWidget{
  final Todo todo;

  const TodoWidget({required this.todo, Key? key,}):super(key: key);
  
  @override
  Widget build(BuildContext context){
    final provider = Provider.of<TodoList>(context);
    
    return  Container(
    padding: EdgeInsets.all(20),
    color: const Color.fromARGB(255, 243, 241, 241),
    child: Row(children: [
      Checkbox(
        activeColor: Theme.of(context).primaryColor,
        checkColor: Colors.white,
        value: todo.isCompleted, onChanged: (onChanged){
          Todo newTodo=Todo(title: todo.title, createdTime: DateTime.now(),isCompleted: !todo.isCompleted);
          provider.editTodo(todo, newTodo);

        }),
        const SizedBox(width: 20,),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          Text(todo.title), 
          Text(todo.description),
        ],)),

        const SizedBox(width: 20,),
        IconButton(onPressed:()=>showDialog(context: context, barrierDismissible: false,builder: (context) {
          String id=todo.id;
          String tl=todo.title;
          String dc=todo.description;
        
          return EditTodoForm(id: id, onChangedTitle: (tl){}, onChangedDescription: (dc){}, onSavedTodo: (){});
        },), icon:  Icon(Icons.edit,color: Colors.purple[900],)),
        const SizedBox(width: 20,),

        IconButton(onPressed: (){
         Todo newTodo=Todo(title: todo.title, createdTime: DateTime.now(),isStarred: !todo.isStarred, description: todo.description,isCompleted: todo.isCompleted);
         provider.editTodo(todo, newTodo);

        }, icon: todo.isStarred ? Icon(Icons.star,color: Colors.amber[700],) : Icon(Icons.star)),

        const SizedBox(width: 20,),
        IconButton(onPressed: (){
          provider.deleteTodo(todo);
        }, icon: Icon(Icons.delete)),
    ],),
  );

  }
  
}