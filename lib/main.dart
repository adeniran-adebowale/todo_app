// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/features/homepage.dart';
import 'package:todo_app/src/services/provider_todo.dart';

void main() {
  runApp(ChangeNotifierProvider<TodoList>(
 child: TodoApp(),
 create: (context) => TodoList(),
 ),);
}

class TodoApp extends StatelessWidget {
  static const String title = 'Todo App';

  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          fontFamily: 'Roboto',
          //primarySwatch: Colors.purple,
          appBarTheme: AppBarTheme(
            color:Colors.white,
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 243, 241, 241),
        ),
        home: HomePage(),
      );
}
