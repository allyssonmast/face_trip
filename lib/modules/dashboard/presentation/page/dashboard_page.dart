import 'package:auto_route/auto_route.dart';
import 'package:facetrip/routes/routes_imports.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomePageRoute(),
        SearchContactsRoute(),
        SettingsPageRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
            body: child,
            bottomNavigationBar: NavigationBar(
              selectedIndex: tabsRouter.activeIndex,
              onDestinationSelected: tabsRouter.setActiveIndex,
              destinations: const [
                NavigationDestination(
                    label: 'Contacts', icon: Icon(Icons.group)),
                NavigationDestination(
                  label: 'Search',
                  icon: Icon(Icons.search_rounded),
                ),
                NavigationDestination(
                    label: 'Settings', icon: Icon(Icons.settings)),
              ],
            ));
      },
    );
  }
}
