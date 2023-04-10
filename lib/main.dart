import 'package:flutter/material.dart';
//import 'package:recipe/home/homescreen.dart';

import '../test.dart';
import 'API/API_connection.dart';
import 'model/Storagemodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Wait for the async code to complete before running the app
  Store store = await initializeApp();
  runApp( MyApp(store: store,));
}

Future<Store> initializeApp() async {
  dynamic apiResult1;
  Store store = Store();
  APIService apiService = APIService();
  List<int>? recipeId = [];

  apiResult1 = await apiService.get_recipe_id(40);
  apiResult1.recipeId!.values!.forEach((value) {
    recipeId.add(value);
  });
  store.popularRecipeID = recipeId;
  return store;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.store});
  final Store store;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/home.jpg"), context);
    return MaterialApp(
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
        // home:  SplashScreen(title: 'Good Food'),
        home: Test(
          store: widget.store,
        ));
  }
}
