import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/features/todo_widget.dart';
import 'package:todo_app/src/models/todo.dart';
import 'package:todo_app/src/services/provider_todo.dart';

class TodoFavoriteView extends StatelessWidget {
  const TodoFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
final provider = Provider.of<TodoList>(context);
final todos= provider.favorite_todos;




    return todos.isEmpty ? Text("No Todos is Starred at the Moment ",style: TextStyle(fontSize: 20),): ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) => Container(height: 10,),
itemCount: todos.length,
itemBuilder: (context,index){
  final todo=todos[index];
return TodoWidget(todo: todo);
},

    );
  }
}
