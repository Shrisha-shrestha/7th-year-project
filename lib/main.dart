

import 'package:firebase_admin/firebase_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_admin/firebase_admin.dart' as admin;

import 'package:provider/provider.dart';
import 'package:recipe/Bloc/CookBook_Bloc/recipe_observer.dart';
import 'package:recipe/helper/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Bloc/FId_Bloc/fid_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var credential = Credentials.applicationDefault();
  credential ??= await Credentials.login();
  var projectId = 'some-project';
  var app = FirebaseAdmin.instance.initializeApp(AppOptions(
      credential: credential,
      projectId: projectId,
      storageBucket: '$projectId.appspot.com'));
 try {
    // get a user by email
    var v = await app.auth().getUserByEmail('sri@gmail.com');
    print(v.toJson());
  } catch (e) {
    print(e);
  }
  runApp(MultiProvider(
      providers: [
        BlocProvider<FireidCubit>(
          create: (BuildContext context) => FireidCubit(),
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

    
  }
}

