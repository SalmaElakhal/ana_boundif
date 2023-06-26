import 'package:ana_boundif/screens/defi_screen.dart';
import 'package:ana_boundif/screens/homePg_screen.dart';
import 'package:ana_boundif/screens/test_screen.dart';
import 'package:ana_boundif/widgets/Game&Quiz/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:ana_boundif/screens/groups_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePgScreen(),
    GroupsScreen(),
    DefisScreen(),
    Quiz(),
  ];

  @override
  Widget build(BuildContext context) {
    bool showBottomNavigationBar = true;

    if (_currentIndex == 3 || _currentIndex == 2) {
      showBottomNavigationBar = false;
    }

    return Scaffold(
      body: Stack(
        children: [
          Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) {
                  if (_currentIndex == 1) {
                    return GroupsScreen();
                  } else {
                    return _screens[_currentIndex];
                  }
                },
              );
            },
          ),
          if (showBottomNavigationBar) // Condition pour afficher ou masquer la barre de navigation
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Accueil',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.group),
                    label: 'Groupes',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.assignment),
                    label: 'Défis',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.west),
                    label: 'Quiz',
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                  if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GroupsScreen()),
                    );
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}
