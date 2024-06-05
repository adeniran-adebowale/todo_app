class Todo{
String id;
String title;
String description;
String category;
DateTime createdTime;

bool isCompleted=false;
bool isStarred=false;
DateTime  defaultDueDate=DateTime.now().add(Duration(days: 60));
// DateTime dueDate=defaultDueDate;

Todo({required this.title, this.isCompleted=false,this.id='', required this.createdTime, this.description='',this.isStarred=false,this.category='General' });

}

class TodoField{
  static const createdTime='createdTime';
}