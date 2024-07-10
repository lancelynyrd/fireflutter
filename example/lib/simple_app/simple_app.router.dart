import 'package:example/simple_app/screens/home/simple.home.screen.dart';
import 'package:example/simple_app/screens/main/main.simple.screen.dart';
import 'package:example/simple_app/screens/menu/simple.menu.screen.dart';
import 'package:example/simple_app/screens/user/simple.sign_up.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fireflutter/fireflutter.dart';
import 'package:fireflutter/user/screens/user.public_profile.screen.dart';

final GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey();
BuildContext get globalContext => globalNavigatorKey.currentContext!;

/// GoRouter
final simpleRouter = GoRouter(
  navigatorKey: globalNavigatorKey,
  routes: [
    GoRoute(
      path: MainSimpleScreen.routeName,
      builder: (context, state) => const MainSimpleScreen(),
    ),
    GoRoute(
      path: SimpleHomeScreen.routeName,
      builder: (context, state) => const SimpleHomeScreen(),
    ),
    GoRoute(
      path: SimpleMenuScreen.routeName,
      builder: (context, state) => const SimpleMenuScreen(),
    ),
    GoRoute(
      path: SimpleSignUpScreen.routeName,
      builder: (context, state) => const SimpleSignUpScreen(),
    ),
    GoRoute(
      path: UserProfileUpdateScreen.routeName,
      builder: (context, state) => Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
            ),
            listTileTheme: ListTileThemeData(
                shape: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.outline),
            )),
            snackBarTheme: SnackBarThemeData(
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          child: const UserProfileUpdateScreen()),
    ),
    GoRoute(
      path: UserPublicProfileScreen.routeName,
      builder: (context, state) => UserPublicProfileScreen(
        user: (state.extra as Map)['user'],
      ),
    ),
  ],
);
