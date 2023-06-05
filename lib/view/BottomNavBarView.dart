import 'package:flutter/material.dart';

import 'MoreScreen.dart';
import 'OrderScreen.dart';
import 'ServiceScreen.dart';
import 'UserScreen.dart';

class BottomNavBarView extends StatefulWidget {
  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarView> {
  int _currentIndex = 2;

  final List<Widget> _screens = [
    MoreScreen(),
    UserScreen(),
    ServiceScreen(),
    OrderScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.blue, // Set the desired background color here
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'More',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.build),
              label: 'Service',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Order',
            ),
          ],
        ),
      ),
    );
  }
}
