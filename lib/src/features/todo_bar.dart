import 'package:flutter/material.dart';
import 'package:todo_app/src/features/addtodo.dart';
import 'package:todo_app/src/features/todo_list_view.dart';

class TodoBar extends StatelessWidget {
  const TodoBar({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [],
            ),
          ),
          SizedBox(
            height: 10,
            child: Text("All To Do"),
          ),
          TodoListView()
        ],
      ),
    );
  }
}
