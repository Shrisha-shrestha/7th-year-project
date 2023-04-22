import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/Bloc/FId_Bloc/fid_cubit.dart';
import 'package:recipe/Bloc/PInfo_Bloc/pinfo_cubit.dart';
import 'package:recipe/Bloc/UserId_Bloc/userid_cubit.dart';
import 'package:recipe/Splash/loading.dart';
import 'package:recipe/model/Storagemodel.dart';

import '../Bloc/CookBook_Bloc/recipe_cubit.dart';

import '../authentication/authenticationServices.dart';

import '../home/homeprovider.dart';

class wrapper extends StatelessWidget {
  const wrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FireidCubit, Stream<Userid?>?>(
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
              // return HomeScreen(fid: snapshot.data!.uid.toString());
              return MultiBlocProvider(
                providers: [
                  BlocProvider<CookBookCubit>(
                    create: (_) => CookBookCubit(snapshot.data!.uid.toString()),
                  ),
                  BlocProvider<UseridCubit>(
                    create: (_) => UseridCubit(snapshot.data!.uid.toString()),
                  ),

                   BlocProvider<PinfoCubit>(
                    create: (_) => PinfoCubit(snapshot.data!.uid.toString()),
                  ),
                ],
                child: HomeScreen(fid: snapshot.data!.uid.toString()),
              );
              // return Test(fid: snapshot.data!.uid.toString());
            } else {
              return Loading();
            }
          },
        );
      }
    });
  }
}
