import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main_page.dart';

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomNavigationBarExample();
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, size: 32),
            activeIcon: Icon(Icons.home_filled, size: 32),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search, size: 32),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.create, size: 32),
            activeIcon: Icon(CupertinoIcons.create, size: 32),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined, size: 32),
            activeIcon: Icon(Icons.favorite, size: 32),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person, size: 32),
            activeIcon: Icon(CupertinoIcons.person_solid, size: 32),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
