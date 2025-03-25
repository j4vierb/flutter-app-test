class Task {
  Task(this.title, this.description, {this.done = false});
  Task.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    done = json['done'];
  }

  late final String title;
  late bool done;
  late String description;

  Map<String, dynamic> toJson() => {'title': title, 'done': done, 'description': description};
}
