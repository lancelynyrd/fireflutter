import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';

class TodoHomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const TodoHomeScreen({super.key});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (_, __, ___) => const TaskCreateScreen(),
                );
              },
              child: const Text("Create a task")),
          Expanded(
            child: TaskListView(
              queryOptions: TaskQueryOptions(),
            ),
          ),
        ],
      ),
    );
  }
}
