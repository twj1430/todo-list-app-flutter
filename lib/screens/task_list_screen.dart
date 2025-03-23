import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();

    return ListView.builder(
      itemCount: taskProvider.tasks.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Checkbox(
              value: taskProvider.tasks[index]["completed"],
              onChanged: (bool? value) {
                taskProvider.toggleTask(index, value!);
              },
            ),
            title: Text(
              taskProvider.tasks[index]["text"],
              style: TextStyle(
                decoration: taskProvider.tasks[index]["completed"]
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => taskProvider.removeTask(index),
            ),
          ),
        );
      },
    );
  }
}
