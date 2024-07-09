import 'package:example/widget_app/screens/admin/admin.wdiget.screen.dart';
import 'package:example/widget_app/screens/user/user.widget.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fireflutter/fireflutter.dart';
import 'package:social_design_system/social_design_system.dart';

/// WidgetHomeScreen
///
class WidgetHomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const WidgetHomeScreen({super.key});

  @override
  State<WidgetHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<WidgetHomeScreen> {
  @override
  void initState() {
    super.initState();
    TranslationService.instance
        .set(key: 'Abc', locale: 'en', value: 'This is ABC');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All widgets in the Model House'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '''This sample app displays all the widgets of the Model House.'''
              ''' Use this app to know what widgets are available and which one to use.'''
              ''' To see the best look, please sign in and add some dummy data.''',
            ),
          ),
          AuthStateChanges(
            builder: (user) => user == null || user.isAnonymous == true
                ? const EmailPasswordLogin()
                : ElevatedButton(
                    onPressed: () => i.signOut(),
                    child: const Text('Logout'),
                  ),
          ),
          MyDoc(
            builder: (user) => user == null
                ? const SizedBox.shrink()
                : Text(
                    'Welcome, ${user.displayName}, ${user.lastLoginAt}, UID: ${user.uid}'),
          ),
          ElevatedButton(
            onPressed: () {
              context.push(UserProfileUpdateScreen.routeName);
            },
            child: const Text('Profile Update'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () => showGeneralDialog(
              context: context,
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const UserWidgetScreen(),
            ),
            child: const Text('User'),
          ),
          ElevatedButton(
            onPressed: () => showGeneralDialog(
              context: context,
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const AdminWidgetScreen(),
            ),
            child: const Text('Admin'),
          ),
          ElevatedButton(
            onPressed: () => showGeneralDialog(
              context: context,
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const CurrentThemeScreen(),
            ),
            child: const Text('Theme and Color'),
          ),
        ],
      ),
    );
  }
}
