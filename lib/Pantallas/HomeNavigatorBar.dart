// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:projecte/Pantallas/HomeScreen.dart';
import 'package:projecte/Pantallas/LibraryScreen.dart';
import 'package:projecte/widgets/Joc.dart';

class HomeNavigatorBar extends StatefulWidget {
  const HomeNavigatorBar({Key? key}) : super(key: key);

  @override
  State<HomeNavigatorBar> createState() => _HomeNavigatorBarState();
}

class _HomeNavigatorBarState extends State<HomeNavigatorBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _centralWidget() {
    if (_selectedIndex == 0) {
      return HomeScreen();
    } else if (_selectedIndex == 1) {
      return LibraryScreen();
    } else {
      return const Icon(Icons.shopping_cart);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _centralWidget(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded, size: 30), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded, size: 30), label: "Library"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded, size: 30), label: "User"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.grey[900],
        onTap: _onItemTapped,
      ),
    );
  }
}
