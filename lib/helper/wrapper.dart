import 'dart:async';

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
import '../pages/search.dart';

class wrapper extends StatelessWidget {
  const wrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UseridCubit, Stream<Userid?>?>(
        builder: (context, state) {
      if (state == null) {
        print('shris');
        return Toggler();
      } else {
        // return Search();

        return StreamBuilder(
          stream: state,
          initialData: null,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return HomeScreen(fid: snapshot.data!.uid.toString());
            } else {
              return Loading();
            }
          },
        );
      }
    });
  }
}
