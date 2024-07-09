import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';

class TaskCreateScreen extends StatefulWidget {
  static const String routeName = '/TodoCreate';
  const TaskCreateScreen({super.key});

  @override
  State<TaskCreateScreen> createState() => _TodoCreateScreenState();
}

class _TodoCreateScreenState extends State<TaskCreateScreen> {
  final titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Create'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            LabelField(
              label: 'TITLE'.t,
              controller: titleController,
            ),
          ],
        ),
      ),
    );
  }
}
