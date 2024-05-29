
import 'package:flutter/material.dart';
import 'package:todo_app/src/models/todo.dart';

class TodoWidget extends StatelessWidget{
  final Todo todo;

  const TodoWidget({required this.todo, Key? key,}):super(key: key);
  
  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(20),
    color: const Color.fromARGB(255, 243, 241, 241),
    child: Row(children: [
      Checkbox(
        activeColor: Theme.of(context).primaryColor,
        checkColor: Colors.white,
        value: todo.isCompleted, onChanged: (onChanged){}),
        const SizedBox(width: 20,),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          Text(todo.title), 
          Text(todo.description),
        ],)),
        const SizedBox(width: 20,),
        IconButton(onPressed: (){}, icon: todo.isStarred ? Icon(Icons.star_border,color: Colors.amber[400],) : Icon(Icons.star)),
        const SizedBox(width: 20,),
        IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
    ],),
  );


  
}