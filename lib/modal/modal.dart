class TaskModel{
  String title;
  String description;
  String id;
  int date;
  bool isdone;
  TaskModel({
    required this.title,
    required this.description,
    required this.date,
    this.id='',
    this.isdone=false
});

  TaskModel.fromjson(Map<String,dynamic>json):this(
    title: json['title'] as String,
    description: json['description'] as String,
    date: json['date'] as int,
    id: json['id'] as String,
    isdone: json['isdone'] as bool
  );

  Map<String,dynamic> tojson(TaskModel task){
    return {
      'title' : title,
      'description' : description,
      'date' : date,
      'isdone' :isdone,
      'id':id
    };
  }

}