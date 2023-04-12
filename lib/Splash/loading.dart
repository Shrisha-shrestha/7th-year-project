import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/load.png',),
            SpinKitThreeBounce(
              size: 25.0,
              color: Colors.amber.withOpacity(0.3),
            )
          ],
        ));
  }
}
