import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:recipe/Bloc/CookBook_Bloc/recipe_cubit.dart';
import 'package:recipe/Bloc/CookBook_Bloc/recipe_observer.dart';
import 'package:recipe/helper/wrapper.dart';

import 'package:recipe/model/Storagemodel.dart';
// import 'package:recipe/home/homeprovider.dart';

import 'package:recipe/pages/search.dart';
import '../authentication/authenticationServices.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Bloc/UserId_Bloc/userid_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(
      providers: [
        // StreamProvider<Userid?>.value(
        //   value: AuthService().user,
        //   initialData: null,
        //   catchError: (context, e) {
        //     print('error in LocationModelNormal: ${e.toString()}');

        //     return null;
        //   },
        // ),
        BlocProvider<CurrentidCubit>(
          create: (BuildContext context) => CurrentidCubit(),
        ),
        BlocProvider<UseridCubit>(
          create: (BuildContext context) => UseridCubit(),
        ),
        BlocProvider<RecipeCubit>(
          create: (BuildContext context) => RecipeCubit(),
        ),
      ],
      child: MaterialApp(
          title: 'Recipe App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color.fromRGBO(232, 219, 202, 1),
              secondary: const Color.fromRGBO(201, 172, 131, 1),
            ),
            unselectedWidgetColor: const Color.fromRGBO(224, 207, 184, 1),
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: Material(child: MyApp()))));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/home.jpg"), context);

    Bloc.observer = const RecipeObserver();
    return wrapper();

    // return StreamProvider<Userid?>.value(
    //     value: AuthService().user,
    //     initialData: null,
    //     catchError: (context, e) {
    //       print('error in LocationModelNormal: ${e.toString()}');
    //       //or pop a dialogue...whatever.
    //       return null;
    //     },
    //     child: Search()
    //     // home:ProfileScreen()
    //     );

    //     return ChangeNotifierProvider(
    // create: (_) => SigningUser(),
    // child:const ProfileScreen());
  }
}
