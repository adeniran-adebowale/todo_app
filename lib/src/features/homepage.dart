import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/src/features/addtodo.dart';
import 'package:todo_app/src/features/todo_bar.dart';
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
    List<Widget> tabViews=[
      SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
          
            width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(5),
            child: TabBarView(
              children:[TodoBar(),
                TodoFavoriteView(),
                TodoCompletedView(),] ,
            ),
          ),
        ),
        Container(), 
        AddTodo(),
        Container(),
        Container(),
        Container(),
        ];
    final tabs = [
     // TodoListView(),
      //TodoBar(),
      //TodoFavoriteView(),
      //TodoCompletedView(),
    //  Container()
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(

        resizeToAvoidBottomInset: false,
        appBar: AppBar(

          title: Padding(
            padding: const EdgeInsets.all(0.0),
          
            child: Column(
              children: [
                
                Row(
                  children: [
                    
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            hintText: "To do, task, plan..",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: Icon(Icons.search_rounded),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          5), // Adjust the radius as needed
                      child: Image.asset(
                        'assets/dubai.png',
                        fit: BoxFit.cover,
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ],
                ),
                
              ],
            ),
          ),
          bottom:  PreferredSize(
            preferredSize: Size.fromHeight(35),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: const TabBar(
                isScrollable: false,
                
                
                unselectedLabelColor: Colors.black,
                
                
                
               
                tabs: [Text("To Do" ),Text("Planning" ),Text("Done" ),] ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.blue,
          currentIndex: selectedIndex,
          onTap: (index) => setState(() {
            selectedIndex = index;
          }),
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.add_box_outlined),
              label: 'Add To Do',
              
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.calendar_month_outlined),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_outlined),
              label: 'More',
            ),
          ],
        ),
        body: tabViews[selectedIndex],
        // SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        //   child: Container(
          
        //     width: MediaQuery.of(context).size.width,
        //        height: MediaQuery.of(context).size.height,
        //     padding: EdgeInsets.all(5),
        //     child: TabBarView(
        //       children:[TodoBar(),
        //         TodoFavoriteView(),
        //         TodoCompletedView(),] ,
        //     ),
        //   ),
        // ),
        //tabBar[selectedIndex],
        // floatingActionButton: FloatingActionButton(
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        //   onPressed: () => showDialog(
        //     context: context,
        //     barrierDismissible: false,
        //     builder: (context) {
        //       return AddTodo();
        //     },
        //   ),
        //   child: Icon(Icons.add),
        // ),
      ),
    );
  }
}
