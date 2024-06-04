import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/models/todo.dart';
import 'package:todo_app/src/services/provider_todo.dart';

class CategoryCard extends StatelessWidget {
  final String todo_category;
  final int completed;
  final int total_todos;
  final Color clr;

  const CategoryCard(this.todo_category,this.completed, this.total_todos,this.clr,{super.key});



  @override
  Widget build(BuildContext context) {
 
double percent=double.parse((completed/total_todos*100).toStringAsFixed(2));



    return Card(
                  // color: Colors.orange.shade100,
                  
                 
                  child: SizedBox(
                    width: 150,
                    height: 200,

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                        children: [
                          Text(
                            "${todo_category}",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${completed}/${total_todos} Completed",
                            style: TextStyle(fontSize: 12),
                          ),
                          Center(
                            child: CircularPercentIndicator(
                              radius: 28,
                              lineWidth: 5,
                              animation: true,
                              percent:  percent/ 100,
                              backgroundColor: Colors.white,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.orange.shade600,
                              center: Text(
                                "${percent}%",
                                style: TextStyle(fontSize: 12.0, color: Colors.black),
                              ),
                            ),
                          ),
                          TextButton.icon(
                              onPressed: () {},
                              label: Text("Add To Do", style: TextStyle(fontSize: 12)),
                              icon: Icon(Icons.add_box_outlined,size: 12,),
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                 
                                  
                                  )
                              ),
                        ],
                      ),
                    ),
                  ),
                )
              
              ;
  }
}