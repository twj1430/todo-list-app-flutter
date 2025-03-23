import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _tasks = [];

  List<Map<String, dynamic>> get tasks => _tasks;

  TaskProvider() {
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    _tasks.addAll(
      (prefs.getStringList('tasks') ?? []).map(
        (task) => {"text": task, "completed": false},
      ),
    );
    notifyListeners();
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'tasks',
      _tasks.map((task) => task["text"] as String).toList(),
    );
  }

  void addTask(String taskText) {
    _tasks.add({"text": taskText, "completed": false});
    _saveTasks();
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    _saveTasks();
    notifyListeners();
  }

  void toggleTask(int index, bool value) {
    _tasks[index]["completed"] = value;
    _saveTasks();
    notifyListeners();
  }
}
