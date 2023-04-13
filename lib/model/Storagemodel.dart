import 'dart:io';

import 'GetDescription.dart';

class Store {
  List<int>? popularRecipeID;
  List<int>? modelRecipeID;
    List<int>? newRecipeID;

  List<String>? popularimagelist;
  List<String>? modelimagelist;
    List<String>? newimagelist;


  RecipeDescriptionResponseModel? populardescription;
  RecipeDescriptionResponseModel? modeldescription;
    RecipeDescriptionResponseModel? newdescription;

  RecipeDescriptionResponseModel? onDemandDescription;

  Store(
      {this.popularRecipeID,
      this.modelRecipeID,
      this.popularimagelist,
      this.modelimagelist,
      this.modeldescription,
      this.populardescription,
      this.onDemandDescription});
}

class Userid{
  final String? uid;
  Userid({ this.uid});
}