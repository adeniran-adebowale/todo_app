class Todo{
String id;
String title;
String description;
String category;
DateTime createdTime;
bool isCompleted=false;
bool isStarred=false;


Todo({required this.title, this.isCompleted=false,this.id='', required this.createdTime, this.description='',this.isStarred=false,this.category='General'});

}

class TodoField{
  static const createdTime='createdTime';
}