import 'package:example/simple_app/screens/home/simple.home.screen.dart';
import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_sign_in/phone_sign_in.dart';

class SimpleSignInScreen extends StatefulWidget {
  static const String routeName = '/Login';
  const SimpleSignInScreen({super.key});

  @override
  State<SimpleSignInScreen> createState() => _SimpleSignScreenState();
}

/// Changed the login screen temporarily to make a test flow
class _SimpleSignScreenState extends State<SimpleSignInScreen> {
  String loginType = 'email';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'.t),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (loginType == 'email') ...{
                EmailPasswordLogin(
                  onLogin: afterSignIn,
                ),
              } else if (loginType == 'phone') ...{
                PhoneSignIn(
                  linkCurrentUser: true,
                  onSignInSuccess: afterSignIn,
                  onSignInFailed: (e) {
                    dog('---error');
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
              },
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      indent: 12,
                    ),
                  ),
                  Text('  or  '.t),
                  const Expanded(
                    child: Divider(
                      endIndent: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  if (loginType == 'email') {
                    loginType = 'phone';
                  } else if (loginType == 'phone') {
                    loginType = 'email';
                  }

                  setState(() {});
                },
                child: const Text('Sign In with phone number'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  afterSignIn() {
    if (context.mounted) {
      context.go(SimpleHomeScreen.routeName);
    }
  }
}
