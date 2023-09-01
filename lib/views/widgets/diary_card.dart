import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryCard extends StatelessWidget {
  final String title;
  final String description;
  final DateTime deadline;
  final String priority;
  final bool involvesPatient;
  final String category;
  final bool taskDone;
  const DiaryCard(
      {super.key,
      required this.title,
      required this.description,
      required this.deadline,
      required this.priority,
      required this.involvesPatient,
      required this.category,
      required this.taskDone});
  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            trailing:
                Icon(Icons.done, color: taskDone ? Colors.green : Colors.red),
            tileColor: priority == "critical"
                ? Colors.red
                : priority == "high"
                    ? Colors.orange
                    : priority == "normal"
                        ? Colors.yellow
                        : priority == "low"
                            ? Colors.green
                            : Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
          ),
          ListTile(
            title: Text(description),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.all(15), //apply padding to all four sides
                child: Text(
                  category,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.all(15), //apply padding to all four sides
                child: Icon(
                  Icons.people,
                  color: involvesPatient ? Colors.green : Colors.red,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.all(15), //apply padding to all four sides
                child: Text(
                  formatter.format(deadline),
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
