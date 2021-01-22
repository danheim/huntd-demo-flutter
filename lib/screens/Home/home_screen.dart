import 'package:flutter/material.dart';
import 'package:flutter_huntd_demo/constants.dart';
import 'package:flutter_huntd_demo/screens/Home/widgets/home_body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tabIndex = 0;

  void _tabHandler(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(tabIndex: _tabIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Profile',
          ),
        ],
        currentIndex: _tabIndex,
        selectedItemColor: colorCitrus,
        onTap: _tabHandler,
      ),
    );
  }
}
