import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class InsertTaskScreen extends StatelessWidget {
  const InsertTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final TextEditingController taskController = TextEditingController();

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: taskController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter task',
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              if (taskController.text.isNotEmpty) {
                taskProvider.addTask(taskController.text);
                taskController.clear();
              }
            },
            child: Text("Add Task"),
          ),
        ],
      ),
    );
  }
}
