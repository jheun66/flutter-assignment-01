import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/features/main_navigation/home/home_screen.dart';
import 'package:threads_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:threads_clone/features/main_navigation/write/write_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onWriteTap(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => WriteScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(offstage: _selectedIndex != 0, child: HomeScreen()),
          Offstage(
            offstage: _selectedIndex != 1,
            child: Container(
              child: Center(
                child: Text("Search"),
              ),
            ),
          ),
          // Offstage(offstage: _selectedIndex != 2, child: WriteScreen()),
          Offstage(
            offstage: _selectedIndex != 3,
            child: Container(
              child: Center(
                child: Text("Notifications"),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: Container(
              child: Center(
                child: Text("Profile"),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                onTap: () => _onTap(0)),
            NavTab(
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.magnifyingGlass,
                onTap: () => _onTap(1)),
            NavTab(
                isSelected: _selectedIndex == 2,
                icon: FontAwesomeIcons.penToSquare,
                onTap: () => _onWriteTap(context)),
            NavTab(
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.heart,
                onTap: () => _onTap(3)),
            NavTab(
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                onTap: () => _onTap(4)),
          ],
        ),
      ),
    );
  }
}
