class Task {
  String title;
  String description;
  DateTime deadline;
  String priority;
  bool involvesPatient;
  String category;
  String? currentSituation;
  bool taskDone = false;

  Task({
    required this.title,
    required this.description,
    required this.deadline,
    required this.priority,
    required this.involvesPatient,
    required this.category,
    this.currentSituation,
    required this.taskDone,
  });

  factory Task.fromJson(dynamic json) {
    return Task(
      title: json["title"],
      description: json["description"],
      deadline: DateTime.parse(json["deadline"]),
      priority: json["priority"],
      involvesPatient: json["involves_patient"],
      category: json["category"],
      taskDone: false,
    );
  }
  static List<Task> tasksFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Task.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Task {title: $title, description: $description, deadline: $deadline, priority: $priority,involves_patient: $involvesPatient,category: $category}';
  }
}
