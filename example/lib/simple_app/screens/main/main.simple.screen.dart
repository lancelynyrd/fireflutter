import 'package:example/simple_app/screens/home/simple.home.screen.dart';
import 'package:example/simple_app/screens/menu/simple.menu.screen.dart';
import 'package:example/simple_app/screens/user/simple.user_list.screen.dart';
import 'package:example/simple_app/state/simple.app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fireflutter/fireflutter.dart';

class MainSimpleScreen extends StatelessWidget {
  static const String routeName = '/';
  const MainSimpleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      int index = ref.watch(mainTabIndexProvider);
      return Scaffold(
        body: IndexedStack(
          index: index,
          children: const [
            SimpleHomeScreen(),
            SimpleUserListScreen(),
            SimpleMenuScreen(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (v) {
            ref.read(mainTabIndexProvider.notifier).state = v;
          },
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home),
              label: 'home'.t,
            ),
            NavigationDestination(
              icon: const Icon(Icons.search),
              label: 'search'.t,
            ),
            NavigationDestination(
              icon: const Icon(Icons.menu),
              label: 'menu'.t,
            ),
            // NavigationDestination(
            //   icon: const FaIcon(FontAwesomeIcons.thinGamepad),
            //   label: 'game'.t,
            // ),
            // NavigationDestination(
            //   icon: const FaIcon(FontAwesomeIcons.thinBars),
            //   label: 'menu'.t,
            // ),
          ],
        ),
      );
    });
  }
}
