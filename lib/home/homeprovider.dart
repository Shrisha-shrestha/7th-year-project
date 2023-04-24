import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/Splash/loading.dart';
import 'package:recipe/pages/cookBook.dart';
import 'package:recipe/pages/profile.dart';
import '../Bloc/UserId_Bloc/userid_cubit.dart';
import '../helper/wrapper.dart';
import '../model/Storagemodel.dart';
import '../model/firebasecollection.dart';
import '../pages/cookBook.dart';
import '../pages/dashboard.dart';
import '../pages/home.dart';
import '../pages/search.dart';

import '../authentication/authenticationServices.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.fid});
  final String fid;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Home(
        fid: widget.fid,
      ),
      Search(
        fid: widget.fid,
      ),
      CookBook(
        fid: widget.fid,
      ),
      ProfileScreen(
        fid: widget.fid,
      ),
    ];

    final PageStorageBucket bucket = PageStorageBucket();

    Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
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
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: ''),
          ],
        );

    return BlocBuilder<UseridCubit, Stream<Currentuserid?>?>(
      builder: (context, state) {
        return StreamBuilder(
            stream: state,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Currentuserid? ud = snapshot.data;
                String role = ud!.role;
                if (role == 'Client') {
                  return Scaffold(
                    bottomNavigationBar: _bottomNavigationBar(selectedindex),
                    body: PageStorage(
                      child: pages[selectedindex],
                      bucket: bucket,
                    ),
                  );
                } else {
                  return Dashboard(
        fid: widget.fid,
      );
                }
              } else {
                return Loading();
              }
            });
      },
    );
  }
}
