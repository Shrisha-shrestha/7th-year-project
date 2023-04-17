import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:recipe/Bloc/UserId_Bloc/userid_cubit.dart';
import 'package:recipe/Splash/loading.dart';
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
    // final id = Provider.of<Userid?>(context);

    return BlocBuilder<UseridCubit, Stream<Userid?>>(
      builder: (context, state) {
        String? u;
        state.listen((Userid? value) {
          u = value!.uid;
          print('Firebase id : ${value.uid}');

          if (u == null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Toggler(),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(fid:u!),
              ),
            );
          }
          
        });
        return Toggler();
      },
    );

    // if (id == null) {
    //   print('k');
    //   return Toggler();
    // } else {
    //   print('o');
    //   return HomeScreen();
    // }
  }
}
