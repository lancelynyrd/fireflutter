import 'package:example/simple_app/screens/home/simple.home.screen.dart';
import 'package:flutter/material.dart';
import 'package:fireflutter/widgets/auth/email_password_login.dart';
import 'package:go_router/go_router.dart';

class SimpleSignInScreen extends StatefulWidget {
  static const String routeName = '/SimpleSignIn';
  const SimpleSignInScreen({super.key});

  @override
  State<SimpleSignInScreen> createState() => _SimpleSignInScreenState();
}

class _SimpleSignInScreenState extends State<SimpleSignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SimpleSignIn'),
      ),
      body: Column(
        children: [
          EmailPasswordLogin(
            onLogin: () {
              context.go(SimpleHomeScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
