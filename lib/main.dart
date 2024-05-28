import 'package:flutter/material.dart';
import 'package:todo_app/src/features/homepage.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  static const String title='Todo App';
  
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context)=> MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      appBarTheme: AppBarTheme(
        color: Colors.deepPurple.shade200,
      ),
      scaffoldBackgroundColor: Color(0xFFf6f5ee)
    ),
    home: HomePage(),

  );
}
