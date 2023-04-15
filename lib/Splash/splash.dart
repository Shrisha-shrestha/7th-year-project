import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:recipe/authentication/login.dart';
import 'package:recipe/authentication/register.dart';
import 'package:recipe/helper/wrapper.dart';

import '../model/Storagemodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, });



  @override
  State<SplashScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {
  PageController controller = PageController();

  int _curr = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> _list = <Widget>[
      Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/splash.jpg'))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Good Food',
                      style: TextStyle(
                          color: Colors.brown[600],
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Deliciously Simple',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[600],
                          fontSize: 15.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.85,
            left: MediaQuery.of(context).size.height * 0.05,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      //backgroundColor: Theme.of(context).colorScheme.secondary,
                      backgroundColor: Colors.brown[800]),
                  onPressed: () {
                    controller.animateTo(1500,
                        duration: const Duration(milliseconds: 1500),
                        curve: Curves.easeInOut);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70.0, vertical: 10.0),
                    child: const Text(
                      'Start  Cooking',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
              ],
            ),
          ),
        ],
      ),
      Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/donuts.jpg'))),
          ),
          Center(
              child: Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: EdgeInsets.all(35.0),
              child: Column(children: [
                Icon(
                  Icons.cookie_outlined,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 80.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Good Food',
                  style: TextStyle(
                      color: Colors.brown[400],
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Nutritiousally balanced, easy to cook recipes. Quality fresh local ingredients ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18.0),
                ),
                SizedBox(
                  height: 35.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => wrapper()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 45.0, vertical: 10.0),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Text.rich(TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => wrapper()));
                          },
                      ),
                    ]))
              ]),
            ),
          )),
        ],
      ),
    ];
    return Scaffold(
      body: PageView(
        allowImplicitScrolling: true,
        children: _list,
        scrollDirection: Axis.vertical,
        // reverse: true,
        // physics: BouncingScrollPhysics(),
        controller: controller,
        onPageChanged: (num) {
          setState(() {
            _curr = num;
          });
        },
      ),
    );
  }
}
