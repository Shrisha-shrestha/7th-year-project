import 'package:flutter/material.dart';
import '../API/API_connection.dart';
import '../model/GetDescription.dart';
import '../model/Storagemodel.dart';

Future<RecipeDescriptionResponseModel?> getD(List<int>? idlist) async {
  dynamic apiResult;
  APIService apiService = APIService();
  apiResult = await apiService.getdescription(
      idlist![0], idlist[1], idlist[2], idlist[3], idlist[4]);
  return apiResult;
}

Future<List<String>?> getI(
    Store store, RecipeDescriptionResponseModel desc) async {
  APIService apiService = APIService();
  List<String>? images = [];
  int n = desc.descriptions.length;
  for (int i = 0; i < n; i++) {
    String url;
    String urlString = desc.descriptions[i].images;
    if (urlString.contains("(")) {
      String urlSubString = urlString.substring(
          urlString.indexOf("(") + 1, urlString.lastIndexOf(")"));
      List<String> urlList = urlSubString.split(", ");
      url = urlList[0];
      images.add(url);
    } else {
      url = urlString;
      images.add(url);
    }
  }
  return images;
}

Future<Store> initializeApp(int id) async {
  print(id);
  Store store = Store();
  dynamic apiResult1;
  APIService apiService = APIService();

  // get popular recipe's id
  List<int>? recipeId1 = [];
  apiResult1 = await apiService.get_recipe_id(id);
  apiResult1.recipeId!.values!.forEach((value) {
    recipeId1.add(value);
  });
  // get popular recipe's description
  store.popularRecipeID = recipeId1;
  store.populardescription = await getD(store.popularRecipeID);
  // Get popular recipe's images
  store.popularimagelist = await getI(store, store.populardescription!);

  //get model based recommended recipe's id
  dynamic apiResult2;
  List<int>? recipeId2 = [];
  apiResult2 = await apiService.get_recipe_id2(id);
  apiResult2.userRatings!.keys!.forEach((value) {
    recipeId2.add(int.parse(value));
  });
  store.modelRecipeID = recipeId2;
  //get model recommended recipe's description
  store.modeldescription = await getD(store.modelRecipeID);
  print(store.modeldescription!.descriptions.length);
  // Get model recipe's images
  store.modelimagelist = await getI(store, store.modeldescription!);

  //get new recipe's id
  dynamic apiResult3;
  apiResult3 = await apiService.get_recipe_id3();
  store.newRecipeID = apiResult3.newRecipes.values.toList();
  //get new  recipe's description
  store.newdescription = await getD(store.newRecipeID);
  // Get new recipe's images
  store.newimagelist = await getI(store, store.newdescription!);
  return store;
}
