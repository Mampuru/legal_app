import 'package:flutter/material.dart';
import 'package:legal_app/views/search_filter_view.dart';

import 'legislation_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const SearchFilterView(),
    LegislationView(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Legal Assist'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(_currentIndex == 0 ? Icons.home : Icons.home_outlined,
                color: _currentIndex == 0 ? Colors.cyanAccent : Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:  Icon( _currentIndex == 1 ? Icons.search : Icons.search_outlined ,
                color: _currentIndex == 1 ? Colors.cyanAccent : Colors.white),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(_currentIndex == 1 ? Icons.person : Icons.person_outlined,
                color: _currentIndex == 2 ? Colors.cyanAccent : Colors.white),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

//Test widgets
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}
