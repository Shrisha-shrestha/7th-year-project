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
  List<String>? randomimagelist;
  List<String>? categoryimagelist;

  RecipeDescriptionResponseModel? populardescription;
  RecipeDescriptionResponseModel? modeldescription;
  RecipeDescriptionResponseModel? newdescription;
  RecipeDescriptionResponseModel? searchdescription;
  RecipeDescriptionResponseModel? randomdescription;
  RecipeDescriptionResponseModel? categorydescription;

  RecipeDescriptionResponseModel? cookbook;

  String? firebaseID;

  Store(
      {this.popularRecipeID,
      this.firebaseID,
      this.modelRecipeID,
      this.popularimagelist,
      this.modelimagelist,
      this.modeldescription,
      this.populardescription,
      this.randomdescription,
      this.randomimagelist,
      this.newRecipeID,
      this.newdescription,
      this.newimagelist,
      this.cookbook});
}

class Userid extends ChangeNotifier {
  String? uid;
  Userid({this.uid});
}
