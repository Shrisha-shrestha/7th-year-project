import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:recipe/model/GetModelRecipeId.dart';
import 'package:recipe/model/GetDescription.dart';

import 'API/API_connection.dart';
import 'model/GetPopularRecipeId.dart';
import 'model/Storagemodel.dart';

class Test extends StatefulWidget {
  const Test({super.key, required this.store});
  final Store store;
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Future<RecipeIdResponseModel>? future1;
  Future<ModelBasedResponsemodel>? future2;
  Future<RecipeDescriptionResponseModel>? future3;

  // Future<RecipeIdResponseModel>? GetRID1() async {
  //   dynamic apiResult;
  //   APIService apiService = APIService();
  //   List<int>? recipeId = [];

  //   apiResult = await apiService.get_recipe_id(40);
  //   apiResult.recipeId!.values!.forEach((value) {
  //     recipeId.add(value);
  //   });
  //   store.popularRecipeID = recipeId;
  //   return apiResult;
  // }

  // Future<ModelBasedResponsemodel>? GetRID2() async {
  //   dynamic apiResult;
  //   APIService apiService = APIService();
  //   List<int>? recipeId = [];

  //   apiResult = await apiService.get_recipe_id2(137);
  //   apiResult.userRatings!.keys!.forEach((value) {
  //     recipeId.add(int.parse(value));
  //   });

  //   store.modelRecipeID = recipeId;
  //   print(store.modelRecipeID);
  //   return apiResult;
  // }

  Future<RecipeDescriptionResponseModel>? Getalldata() async {
    dynamic apiResult;
    APIService apiService = APIService();

    apiResult = await apiService.getdescription(
        widget.store.popularRecipeID![0],
        widget.store.popularRecipeID![1],
        widget.store.popularRecipeID![2],
        widget.store.popularRecipeID![3],
        widget.store.popularRecipeID![4]);

    // Define the string of ingredients
    String ingredientsString = apiResult.descriptions[4].images.toString();
// Extract the substring inside the parentheses
    String ingredientsSubstring = ingredientsString.substring(
        ingredientsString.indexOf("(") + 1, ingredientsString.lastIndexOf(")"));

// Split the substring into a List<String>
    List<String> ingredientsList = ingredientsSubstring.split(", ");
    widget.store.popularimagelist = ingredientsList;

    return apiResult;
  }

  @override
  void initState() {
    future3 = Getalldata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.amber,
          // height: MediaQuery.of(context).size.height,
          height: 500.0,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              FutureBuilder(
                  future: future3,
                  builder: (BuildContext ctx,
                      AsyncSnapshot<RecipeDescriptionResponseModel?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Connection waiting');
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Text('Error in connection');
                      } else if (snapshot.hasData) {
                        return Column(
                          children: [
                            Text(snapshot.data!.descriptions[4].images
                                .toString()),
                            // Image.network(
                            //     widget.store.imagelist![0].replaceAll('"', '')),
                          ],
                        );
                      }
                    }
                    return const Text('No future');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
