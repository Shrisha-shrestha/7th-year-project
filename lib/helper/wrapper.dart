import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/model/Storagemodel.dart';
import 'package:recipe/pages/home.dart';
import 'package:recipe/pages/profile.dart';
import '../model/firebasecollection.dart';
import '../authentication/authenticationServices.dart';

import '../home/homeprovider.dart';

class wrapper extends StatelessWidget {
  const wrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final id = Provider.of<Userid?>(context);
    if (id == null) {
      print('k');
      return Toggler();
    } else {
      print('o');
      return HomeScreen();
    }
  }
}
