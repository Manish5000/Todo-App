class TodoModel{
 
  String? id;
  String? title;
  String? isCompleted;

  TodoModel({this.id, this.title, this.isCompleted});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString() != "null" ? json['id'].toString():null;
    title = json['title'].toString() != "null" ? json['title'].toString():null;
    isCompleted = json['is_completed'].toString() != "null" ? json['is_completed'].toString():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['is_completed'] = isCompleted;
    return data;
  }  
}