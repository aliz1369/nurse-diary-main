import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:nurse_diary/models/task.api.dart';
import 'package:nurse_diary/views/widgets/diary_card.dart';
import 'package:nurse_diary/models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Task> _task;
  late List<Task> _sorttask;
  bool _isLoading = true;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final currentDateStart = DateTime.parse("2023-08-24T00:00:00Z");
  final currentDateEnd = DateTime.parse("2023-08-24T23:00:00Z");

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  Future<void> getTasks() async {
    _task = await TaskApi.getTask();
    _sorttask = _task.map((e) => e).toList()
      ..sort((a, b) => a.deadline.compareTo(b.deadline));
    for (int i = 0; i < _sorttask.length; i++) {
      if (_sorttask[i].deadline.isBefore(currentDateStart)) {
        _sorttask[i].currentSituation = "Passed";
      } else if (_sorttask[i].deadline.isAfter(currentDateStart) &&
          _sorttask[i].deadline.isBefore(currentDateEnd)) {
        _sorttask[i].currentSituation = "Current";
      } else {
        _sorttask[i].currentSituation = "Upcoming";
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.emergency),
              SizedBox(width: 10),
              Text("Nurse Diary"),
            ],
          ),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : GroupedListView<Task, String>(
                elements: _sorttask,
                groupBy: (element) => element.currentSituation.toString(),
                groupSeparatorBuilder: (value) => Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      color: value == "Passed"
                          ? Colors.red
                          : value == "Current"
                              ? Colors.yellow
                              : value == "Upcoming"
                                  ? Colors.green
                                  : Colors.black,
                      child: Text(value),
                    ),
                itemBuilder: (context, element) {
                  return GestureDetector(
                      onTap: () {
                        element.taskDone = !element.taskDone;
                        setState(() {});
                      },
                      child: DiaryCard(
                        title: element.title,
                        description: element.description,
                        deadline: element.deadline,
                        priority: element.priority,
                        involvesPatient: element.involvesPatient,
                        category: element.category,
                        taskDone: element.taskDone,
                      ));
                }));
  }
}
