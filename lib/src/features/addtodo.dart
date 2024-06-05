import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/features/add_todo_form.dart';
import 'package:todo_app/src/models/todo.dart';
import 'package:todo_app/src/services/provider_todo.dart';
import 'package:quickalert/quickalert.dart';
import 'package:uuid/uuid.dart'; 

class AddTodo extends StatefulWidget {
  @override
  _AddTodo createState() => _AddTodo();
}

class _AddTodo extends State<AddTodo> {
  final fieldText = TextEditingController();
  String title = '';
  String description = '';
  String category = '';
  String id=Uuid().v4();

void resetFields(){
  fieldText.clear();
}
  @override
  Widget build(BuildContext context){ 
final provider = Provider.of<TodoList>(context);

    
    return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add Your Todo', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),

            const SizedBox(height: 10,),
            
            TodoAddForm(controller: fieldText,    onChangedTitle: (title)=>setState(() {
              this.title=title;
            }), onChangedDescription: (description)=>setState(() {
              this.description=description;
            }), onSavedTodo: (){

              if(title!='' && category!=''){
                provider.addTodoToList(Todo(id: id, title: title,description: description,category: category, createdTime: DateTime.now()));
                QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Todo Added Successfully!',
          autoCloseDuration: const Duration(seconds: 4),
          showConfirmBtn: false,
        );
        fieldText.clear();
        
        

                //Navigator.pop(context);
              }

              

            }, onCategoryChange: (category)=>setState(() {
              this.category=category!;
            }),),
            // const SizedBox(height: 10,),
            // IconButton(onPressed: (){}, icon: Icon(Icons.post_add))
          ],
        ),
      );

  }
}
