import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/features/addtodo.dart';
import 'package:todo_app/src/features/todo_list_view.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todo_app/src/features/views/category_card.dart';
import 'package:todo_app/src/models/todo.dart';
import 'package:todo_app/src/services/provider_todo.dart';
import "package:collection/collection.dart";

class TodoBar extends StatelessWidget {
 List<Color> clr = [
      Colors.orange.shade300,
      Colors.blue.shade200,
      Colors.purple.shade50,
      Colors.red.shade200,
      Colors.orange.shade100,
      Colors.blue.shade50,
      Colors.yellow.shade100,
      Colors.red.shade50,
      Colors.pink.shade100,
      Colors.green.shade50,
      Colors.grey.shade100
    ];
  
 


  List<String> getCategory(List<Todo> todos) {
    List<String> l = [];
    for (var element in todos) {
      l.add(element.category);
    }

    return l.toSet().toList() ;
  }

  CategoryCard getCategoryCard(String category, List<Todo> listOfTodo){
    int completed=0;
    int indx=Random().nextInt(clr.length);
    int total_todos=0;

    for (var element in listOfTodo) {

      if(element.category==category){
        if (element.isCompleted){
          completed++;
          }
        total_todos++;      
        } 
      
    }
    

    return CategoryCard(category, completed, total_todos, clr[indx]);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoList>(context);
    final todos = provider.allTodos;
   List<String> categories=getCategory(todos); 
    

    List<Widget> listOfCard=[];

    for (var element in categories) {
      listOfCard.add(getCategoryCard(element, todos));
      
    }

print(listOfCard.length);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: listOfCard
                //CategoryCard("General", 2, 6, clr[0]),
                // listOfCard.map(()=>).toList(Card);
              ,
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),

          Text("All To Do"),

          TodoListView()
        ],
      ),
    );
  }
}
