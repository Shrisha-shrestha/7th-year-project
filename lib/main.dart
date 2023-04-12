import 'package:flutter/material.dart';
import 'package:recipe/Splash/loading.dart';
import 'package:recipe/Splash/splash.dart';
import 'package:recipe/home/homescreen.dart';
import '../test.dart';
import 'API/API_connection.dart';
import 'model/Storagemodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Wait for the async code to complete before running the app

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FutureBuilder(
      future: initializeApp(),
      // FutureBuilder properties
      builder: (BuildContext context, AsyncSnapshot<Store> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MediaQuery(
            data: MediaQuery.of(context),
            child: Loading(
                // Loading properties
                ),
          );
        } else if (snapshot.hasError) {
          // Handle errors
        } else {
          Store store = snapshot.data!;
          return MyApp(
            store: store,
          );
        }
        return Text('Error ');
      },
    ),
  ));
}

// Future<List<int>> getid() {
//   return 0;
// }

Future<Store> initializeApp() async {
  // get popular recipe's id
  dynamic apiResult1;
  Store store = Store();
  APIService apiService = APIService();
  List<int>? recipeId1 = [];
  apiResult1 = await apiService.get_recipe_id(40);
  apiResult1.recipeId!.values!.forEach((value) {
    recipeId1.add(value);
  });
  store.popularRecipeID = recipeId1;

  //get popular recipe's description
  dynamic apiResult11;
  apiResult11 = await apiService.getdescription(
      store.popularRecipeID![0],
      store.popularRecipeID![1],
      store.popularRecipeID![2],
      store.popularRecipeID![3],
      store.popularRecipeID![4]);
  store.populardescription = apiResult11;

  // Get popular recipe's images
  int n1 = store.populardescription!.descriptions.length;
  List<String>? popularimages = [];
  for (int i = 0; i < n1; i++) {
    String url;
    String urlString = apiResult11.descriptions[i].images;
    if (urlString.contains("(")) {
      String urlSubString = urlString.substring(
          urlString.indexOf("(") + 1, urlString.lastIndexOf(")"));
      List<String> urlList = urlSubString.split(", ");
      url = urlList[0];
      popularimages.add(url);
    } else {
      url = urlString;
      popularimages.add(url);
    }
    store.popularimagelist = popularimages;
  }

  //get model based recommended recipe's id
  dynamic apiResult2;
  List<int>? recipeId2 = [];
  apiResult2 = await apiService.get_recipe_id2(13);
  apiResult2.userRatings!.keys!.forEach((value) {
    recipeId2.add(int.parse(value));
  });
  store.modelRecipeID = recipeId2;

  //get model recommended recipe's description
  dynamic apiResult22;
  apiResult22 = await apiService.getdescription(
      store.modelRecipeID![0],
      store.modelRecipeID![1],
      store.modelRecipeID![2],
      store.modelRecipeID![3],
      store.modelRecipeID![4]);
  store.modeldescription = apiResult22;

  // Get model recipe's images
  int n2 = store.modeldescription!.descriptions.length;
  List<String>? modelimages = [];
  for (int i = 0; i < n2; i++) {
    String url;
    String urlString = apiResult22.descriptions[i].images;
    if (urlString.contains("(")) {
      String urlSubString = urlString.substring(
          urlString.indexOf("(") + 1, urlString.lastIndexOf(")"));
      List<String> urlList = urlSubString.split(", ");
      url = urlList[0];
      modelimages.add(url);
    } else {
      url = urlString;
      modelimages.add(url);
    }
    store.modelimagelist = modelimages;
  }

  //get new recipe's id
  dynamic apiResult3;
  apiResult3 = await apiService.get_recipe_id3();
  store.newRecipeID = apiResult3.newRecipes.values.toList();

  //get new  recipe's description
  dynamic apiResult33;
  apiResult33 = await apiService.getdescription(
      store.newRecipeID![0],
      store.newRecipeID![1],
      store.newRecipeID![2],
      store.newRecipeID![3],
      store.newRecipeID![4]);
  store.newdescription = apiResult33;

  // Get new recipe's images
  int n3 = store.newdescription!.descriptions.length;
  List<String>? newimages = [];
  for (int i = 0; i < n3; i++) {
    String url;
    String urlString = apiResult33.descriptions[i].images;
    if (urlString.contains("(")) {
      String urlSubString = urlString.substring(
          urlString.indexOf("(") + 1, urlString.lastIndexOf(")"));
      List<String> urlList = urlSubString.split(", ");
      url = urlList[0];
      newimages.add(url);
    } else {
      url = urlString;
      newimages.add(url);
    }
    store.newimagelist = newimages;
  }
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
      home: HomeScreen(
        store: widget.store,
      ),
      // home: Test(
      //   store: widget.store,
      // )
    );
  }
}
