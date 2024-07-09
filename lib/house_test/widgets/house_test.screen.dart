import 'package:flutter/material.dart';
import 'package:fireflutter/house_test/unit_tests/todo/todo.unit_test.dart';
import 'package:fireflutter/fireflutter.dart';

class HouseTestScreen extends StatefulWidget {
  static const String routeName = '/HouseTest';
  const HouseTestScreen({super.key});

  @override
  State<HouseTestScreen> createState() => _HouseTestScreenState();
}

class _HouseTestScreenState extends State<HouseTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('House Test'),
      ),
      body: AuthStateChanges(
        builder: (user) => user == null
            ? const Text('Sign in to test')
            : Column(
                children: [
                  Text('Signed in with uid: ${user.uid}'),
                  const Divider(),
                  const Text("To start house test, press the button below"),
                  ElevatedButton(
                    onPressed: () async {
                      // await User.fromUid('abc').updateOnAuthStateChange();
                    },
                    child: const Text('User Model Test'),
                  ),
                  const ElevatedButton(
                    onPressed: testTaskCrud,
                    child: Text('Task CRUD Test'),
                  ),
                  const ElevatedButton(
                    onPressed: testTaskAssign,
                    child: Text('Task Assign Test'),
                  ),
                  // const ElevatedButton(
                  //   onPressed: testDeleteField,
                  //   child: Text('Task Delete Field Test'),
                  // ),
                  // const ElevatedButton(
                  //   onPressed: testCreateWithPriority,
                  //   child: Text('Task Create With Priority Test'),
                  // ),
                ],
              ),
      ),
    );
  }
}
