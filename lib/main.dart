import 'package:flutter/material.dart';
// import 'package:recipe/Splash/splash.dart';
// import 'package:recipe/authentication/login.dart';
// import 'package:recipe/helper/wrapper.dart';
// import 'package:recipe/model/Storagemodel.dart';
// import 'package:recipe/home/homeprovider.dart';
// import 'package:recipe/pages/detail.dart';
// import 'package:recipe/pages/profile.dart';
import 'package:recipe/pages/search.dart';
// import '../authentication/authenticationServices.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MaterialApp(
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
      home: Material(child: MyApp())));
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
    

    return Search();


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
