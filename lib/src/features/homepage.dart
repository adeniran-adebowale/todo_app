import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _TodoAppState();
}

class _TodoAppState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
final tabs=[ Container(), Container() ];

    return Scaffold(
      appBar: AppBar(
        title: Text(TodoApp.title),
      ),
  bottomNavigationBar: BottomNavigationBar(
    backgroundColor: Theme.of(context).primaryColor,
    unselectedItemColor: Colors.white.withOpacity(0.5),
    selectedItemColor: Colors.white,
    currentIndex: selectedIndex,
    onTap: (index)=>setState(() {
      selectedIndex=index;
    }),
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.fact_check_outlined),label: 'Todos',),
    BottomNavigationBarItem(icon: Icon(Icons.add),label: 'Add Todo',),
    
    ],
    ),
    body: tabs[selectedIndex],

 
    );
  }
}