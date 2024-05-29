import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/src/features/addtodo.dart';
import 'package:todo_app/src/features/todo_completed_view.dart';
import 'package:todo_app/src/features/todo_favorite_view.dart';
import 'package:todo_app/src/features/todo_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _TodoAppState();
}

class _TodoAppState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [TodoListView(), TodoFavoriteView() , TodoCompletedView(), Container()];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          TodoApp.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'Completed Todo',
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: ()=>showDialog(context: context, barrierDismissible: false,builder: (context) {
        
          return AddTodo();
        },),
        child: Icon(Icons.add),
      ),
      
    );
  }
}
