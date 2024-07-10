import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fireflutter/fireflutter.dart';
import 'package:fireflutter/user/screens/user.public_profile.screen.dart';
import 'package:phone_sign_in/phone_sign_in.dart';

class SimpleHomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const SimpleHomeScreen({super.key});

  @override
  State<SimpleHomeScreen> createState() => _SimpleHomeScreenState();
}

class _SimpleHomeScreenState extends State<SimpleHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('house.name'.t),
      ),
      body: AuthStateChanges(
        builder: (user) => user != null
            ? Column(
                children: [
                  MyDoc(builder: (my) {
                    if (my == null) return const Text('loading');
                    return Text(my.uid);
                  }),
                  //
                  ElevatedButton(
                    onPressed: () {
                      context.push(UserProfileUpdateScreen.routeName);
                    },
                    child: const Text('Edit Profile'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.push(UserPublicProfileScreen.routeName,
                          extra: {'user': my});
                    },
                    child: const Text('Public Profile'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      UserService.instance.showPublicProfile(context);
                    },
                    child: const Text('Public Profile'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final re = await showDialog<bool?>(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text('Are you sure?'),
                                content: const Text('Do you want to resign?'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        context.pop(true);
                                      },
                                      child: const Text('Yes')),
                                  TextButton(
                                      onPressed: () {
                                        context.pop(false);
                                      },
                                      child: const Text('No'))
                                ],
                              ));

                      if (re == false) return;
                      dog('$re');
                      // user resign
                    },
                    child: const Text('Resign'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final photoUrl = await StorageService.instance.uploadAt(
                        context: context,
                        ref: UserService.instance.col.doc(my!.uid),
                      );
                      dog('$photoUrl');
                    },
                    child: const Text('Upload'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      i.signOut();
                    },
                    child: const Text('Logout'),
                  ),
                  const Expanded(
                    child: UserListView(),
                  ),
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    MyDoc(builder: (my) {
                      if (my == null) return const Text('loading');
                      return Text(my.uid);
                    }),
                    ElevatedButton(
                      onPressed: () {
                        UserService.instance.showProfileUpdaeScreen(context);
                      },
                      child: const Text('Edit Profile'),
                    ),
                    PhoneSignIn(
                      linkCurrentUser: true,
                      onSignInSuccess: () {
                        if (mounted) {
                          setState(() {});
                        }
                      },
                      onSignInFailed: (e) {
                        dog("phonesign Error ----- $e");
                      },
                    ),
                    const Divider(),
                    EmailPasswordLogin(
                      onLogin: () {
                        if (mounted) {
                          setState(() {});
                        }
                      },
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
