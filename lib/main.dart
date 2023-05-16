import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:recipe/Bloc/CookBook_Bloc/recipe_observer.dart';
import 'package:recipe/helper/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Bloc/FId_Bloc/fid_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: FirebaseOptions(
      //   apiKey: 'AIzaSyDMo6YdOTfjB1IvS6xoYuFapQNnlxyjl7s',
      //   projectId: 'recipeapp-f04e1',
      //   appId: '1:490795667221:android:3ad7d49d881b8ca1f6231c',
      //   messagingSenderId: '490795667221',
      // ),
      );

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

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.only(top: 100.0),
//         child: ListView.builder(
//           shrinkWrap: true,
//           itemCount: 5,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (BuildContext context, int index) {
//             return GestureDetector(
//               onTap: () {},
//               child: Stack(
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(right: 15.0),
//                     width: 200,
//                     height: 220,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.grey,
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(right: 15.0),
//                     width: 200,
//                     height: 220,
//                     decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.18),
//                         borderRadius: BorderRadius.circular(20)),
//                   ),
//                   Positioned(
//                       top: 10.0,
//                       right: 28.0,
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Colors.amber[200],
//                             borderRadius: BorderRadius.circular(20)),
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(
//                           '0.0005907989',
//                           style: TextStyle(
//                               color: Colors.black, fontWeight: FontWeight.bold),
//                         ),
//                       )),
//                   Positioned(
//                     bottom: 20,
//                     left: 10,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(
//                           height: 3.0,
//                         ),
//                         Text(
//                           '',
//                           style: const TextStyle(
//                             fontSize: 15,
//                             color: Colors.white,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 3.0,
//                         ),
//                         SizedBox(
//                           width: 190,
//                           child: Text(
//                             '',
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
