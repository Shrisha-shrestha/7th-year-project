import 'package:flutter/material.dart';
import 'package:recipe/Splash/loading.dart';
import 'package:recipe/model/Storagemodel.dart';
import 'package:recipe/home/homeprovider.dart';
import 'package:recipe/pages/profile.dart';
import 'API/API_connection.dart';
import 'model/GetDescription.dart';
import '../authentication/authenticationServices.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


void  main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: FutureBuilder(
//       future: initializeApp(),
//       builder: (BuildContext context, AsyncSnapshot<Store> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return MediaQuery(
//             data: MediaQuery.of(context),
//             child: const Loading(),
//           );
//         } else if (snapshot.hasError) {
//           // Handle errors
//         } else {
//           Store store = snapshot.data!;
//           return MyApp(
//             store: store,
//           );
//         }
//         return const Text('Error in future ');
//       },
//     ),
//   ));
// }


// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//           title: 'Recipe App',
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSwatch().copyWith(
//               primary: const Color.fromRGBO(232, 219, 202, 1),
//               secondary: const Color.fromRGBO(201, 172, 131, 1),
//             ),
//             unselectedWidgetColor: const Color.fromRGBO(224, 207, 184, 1),
//             brightness: Brightness.light,
//           ),
//           darkTheme: ThemeData(
//             brightness: Brightness.dark,
//           ),
//           themeMode: ThemeMode.light,
//           debugShowCheckedModeBanner: false,
//          // home: HomeScreen(store: widget.store,),
//           home:ProfileScreen()
//         );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/home.jpg"), context);

    return StreamProvider<Userid?>.value(
        value: AuthService().user,
        initialData: null,
        catchError: (context, e) {
          print('error in LocationModelNormal: ${e.toString()}');
          //or pop a dialogue...whatever.
          return null;
        },
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
         home: HomeScreen(),
          // home:ProfileScreen()
        ));
  }
}
