import 'package:flutter/material.dart';

import 'models/task.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({
    required this.task,
    super.key,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    // TODO: Implement UI to show the task element
    return const Placeholder();
  }
}
