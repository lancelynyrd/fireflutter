import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';

class TaskDetailScreen extends StatefulWidget {
  static const String routeName = '/TaskDetail';
  const TaskDetailScreen({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TaskDetail'),
      ),
      body: Column(
        children: [
          const Text("TaskDetail"),
          ElevatedButton(onPressed: () {}, child: const Text('UPDATE')),
          ElevatedButton(onPressed: () {}, child: const Text('DELETE')),
        ],
      ),
    );
  }
}
