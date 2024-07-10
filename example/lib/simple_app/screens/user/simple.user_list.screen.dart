import 'package:fireflutter/user/widgets/user.list_view.dart';
import 'package:flutter/material.dart';

class SimpleUserListScreen extends StatelessWidget {
  const SimpleUserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UserListView(),
    );
  }
}
