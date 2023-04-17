import 'package:flutter/material.dart';
import 'package:recipe/pages/profile.dart';
import '../helper/wrapper.dart';
import '../model/Storagemodel.dart';
import '../pages/cookbook.dart';
import '../pages/home.dart';
import '../pages/search.dart';

import '../authentication/authenticationServices.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,required this.fid});
  final String fid;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
       Home(fid: widget.fid,),
      const Search(),
      const CookBook(),
       ProfileScreen(fid: widget.fid,),
    ];
    return Scaffold(
      body: IndexedStack(index: selectedindex, children: pages),
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
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: ''),
        ],
      ),
    );
  }
}
