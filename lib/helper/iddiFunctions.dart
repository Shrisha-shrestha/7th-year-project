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

Future<Store> Recommendations(int id) async {
  print("User id: $id");
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

  //get new recipe's id
  dynamic apiResult3;
  apiResult3 = await apiService.get_recipe_id3();
  store.newRecipeID = apiResult3.newRecipes.values.toList();
  //get new  recipe's description
  store.newdescription = await getD(store.newRecipeID);
  // Get new recipe's images
  store.newimagelist = await getI(store, store.newdescription!);




  //get model based recommended recipe's id
  dynamic apiResult2;
  List<int>? recipeId2 = [];
  List? user_predictions = [];
  apiResult2 = await apiService.get_recipe_id2(id);
  apiResult2.userRatings!.keys!.forEach((value) {
    recipeId2.add(int.parse(value));
  });

  store.modelRecipeID = recipeId2;
  apiResult2.userPredictions!.values!.forEach((value) {
    user_predictions.add(value);
  });
  store.user_predictions = user_predictions;
  //get model recommended recipe's description
  store.modeldescription = await getD(store.modelRecipeID);
  print(store.modeldescription!.descriptions.length);
  // Get model recipe's images
  store.modelimagelist = await getI(store, store.modeldescription!);


  print('done');
  return store;
}

Future<Store> getresults(List<String?> searchterm) async {
  Store store = Store();

  List<int> searchid = [];

  APIService apiService = APIService();
  dynamic val = await apiService.getSearchResults(
      searchterm[0]!, searchterm[1]!, searchterm[2]!);

  val.forEach((key, value) {
    searchid.add(value);
  });
  store.searchdescription = await getD(searchid);
  store.searchimagelist = await getI(store, store.searchdescription!);
  // print(store.searchdescription);
  return store;
}

Future<Store> getcrecipes(String category) async {
  Store store = Store();
  List<int> categoryid = [];

  APIService apiService = APIService();
  dynamic val = await apiService.getcategoryrecipes(category);
  val.forEach((key, value) {
    categoryid.add(value);
  });
  store.categorydescription = await getD(categoryid);
  store.categoryimagelist = await getI(store, store.categorydescription!);
  return store;
}
