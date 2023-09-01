import 'package:flutter/material.dart';
import 'package:nurse_diary/simple_http_client.dart';
import 'models/task.dart';

class TaskOverview extends StatefulWidget {
  const TaskOverview({super.key});

  @override
  State<TaskOverview> createState() => _TaskOverviewState();
}

class _TaskOverviewState extends State<TaskOverview> {
  late SimpleHttpClient httpClient;
  late List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    // TODO: Show empty state, loading state, error state and list of tasks
    return const Placeholder();
  }

  @override
  void initState() {
    // Make an API call to get the tasks

    super.initState();
  }
}
