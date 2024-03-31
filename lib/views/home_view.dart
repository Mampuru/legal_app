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
    SummaryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Legal Assist'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.cyanAccent ))
        ],
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
            icon: Icon(_currentIndex == 2 ? Icons.abc : Icons.abc_outlined,
                color: _currentIndex == 2 ? Colors.cyanAccent : Colors.white),
            label: 'Simplify',
          ),
          BottomNavigationBarItem(
            icon: Icon(_currentIndex == 3 ? Icons.person : Icons.person_outlined,
                color: _currentIndex == 3 ? Colors.cyanAccent : Colors.white),
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

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Summery Screen'),
    );
  }
}
