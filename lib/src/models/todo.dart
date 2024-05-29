class Todo{
String id;
String title;
String description;
DateTime createdTime;
bool isCompleted=false;
bool isStarred=false;


Todo({required this.title, this.isCompleted=false,this.id='', required this.createdTime, this.description='',this.isStarred=false});

}

class TodoField{
  static const createdTime='createdTime';
}