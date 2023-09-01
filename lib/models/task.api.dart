import 'dart:convert';
import 'package:nurse_diary/models/task.dart';
import 'package:http/http.dart' as http;

class TaskApi {
  static Future<List<Task>> getTask() async {
    var uri = Uri.https('k7ap1irwai.api.quickmocker.com', '/tasks');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List temp = [];
      for (var i in data['tasks']) {
        temp.add(i);
      }
      return Task.tasksFromSnapshot(temp);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
