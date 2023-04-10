import 'package:flutter/material.dart';

import '../pages/cookbook.dart';
import '../pages/home.dart';
import '../pages/search.dart';
import '../pages/cookbook.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pages = [Home(), Search(), CookBook(), CookBook()];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedindex,
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.7),
        showUnselectedLabels: false,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.assessment), label: ''),
        ],
      ),
    );
  }
}
