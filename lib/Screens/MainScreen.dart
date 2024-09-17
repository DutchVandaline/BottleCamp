import 'package:bottlecamp/Screens/HomeScreen.dart';
import 'package:bottlecamp/Screens/MapScreen.dart';
import 'package:bottlecamp/Screens/SettingsScreen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;

  const MainScreen({super.key, this.initialIndex = 1});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int currentPageIndex;

  @override
  void initState() {
    currentPageIndex = widget.initialIndex;
    super.initState();
  }

  final List<Widget> _pages = [
    const MapScreen(),
    const HomeScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Theme.of(context).hoverColor,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        destinations: [
          NavigationDestination(
              icon: Icon(
                Icons.pin_drop_outlined,
                size: 33.0,
                color: Theme.of(context).primaryColorLight,
              ),
              label: "Habit"),
          NavigationDestination(
              icon: Icon(
                Icons.home_filled,
                size: 33.0,
                color: Theme.of(context).primaryColorLight,
              ),
              label: "Home"),
          NavigationDestination(
              icon: Icon(
                Icons.settings_outlined,
                size: 33.0,
                color: Theme.of(context).primaryColorLight,
              ),
              label: "Settings"),
        ],
      ),
    );
  }
}
