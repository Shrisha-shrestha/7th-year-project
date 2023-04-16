import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'GetDescription.dart';

class Store {
  List<int>? popularRecipeID;
  List<int>? modelRecipeID;
  List<int>? newRecipeID;

  List<String>? popularimagelist;
  List<String>? modelimagelist;
  List<String>? newimagelist;
  List<String>? searchimagelist;

  RecipeDescriptionResponseModel? populardescription;
  RecipeDescriptionResponseModel? modeldescription;
  RecipeDescriptionResponseModel? newdescription;
  RecipeDescriptionResponseModel? searchdescription;

  RecipeDescriptionResponseModel? cookbook;

  Store(
      {this.popularRecipeID,
      this.modelRecipeID,
      this.popularimagelist,
      this.modelimagelist,
      this.modeldescription,
      this.populardescription,
      this.cookbook});
}

class Userid extends ChangeNotifier {
  String? uid;
  Userid({this.uid});
}
