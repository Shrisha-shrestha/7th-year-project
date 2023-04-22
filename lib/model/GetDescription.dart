class RecipeDescriptionResponseModel {
    RecipeDescriptionResponseModel({
        required this.descriptions,
    });

    List<Description> descriptions;

    factory RecipeDescriptionResponseModel.fromJson(Map<String, dynamic> json) => RecipeDescriptionResponseModel(
        descriptions: List<Description>.from(json["descriptions"].map((x) => Description.fromJson(x))),
    );

   
}

class Description {
    Description({
        required this.recipeId,
        required this.name,
        required this.authorId,
        required this.authorName,
        required this.cookTime,
        required this.prepTime,
        required this.totalTime,
        required this.datePublished,
        required this.description,
        required this.images,
        required this.recipeCategory,
        required this.keywords,
        required this.recipeIngredientQuantities,
        required this.recipeIngredientParts,
        required this.aggregatedRating,
        required this.reviewCount,
        required this.calories,
        required this.fatContent,
        required this.saturatedFatContent,
        required this.cholesterolContent,
        required this.sodiumContent,
        required this.carbohydrateContent,
        required this.fiberContent,
        required this.sugarContent,
        required this.proteinContent,
        required this.recipeServings,
        required this.recipeYield,
        required this.recipeInstructions,
    });

    String recipeId;
    String name;
    String authorId;
    String authorName;
    String cookTime;
    String prepTime;
    String totalTime;
    String datePublished;
    String description;
    String images;
    String recipeCategory;
    String keywords;
    String recipeIngredientQuantities;
    String recipeIngredientParts;
    String aggregatedRating;
    String reviewCount;
    String calories;
    String fatContent;
    String saturatedFatContent;
    String cholesterolContent;
    String sodiumContent;
    String carbohydrateContent;
    String fiberContent;
    String sugarContent;
    String proteinContent;
    String recipeServings;
    String recipeYield;
    String recipeInstructions;

    Map<String,dynamic> toMap(){
      return {
      'RecipeId': recipeId,
      'Name': name,
      'AuthorId': authorId,
      'AuthorName': authorName,
      'CookTime': cookTime,
      'PrepTime': prepTime,
      'TotalTime': totalTime,
      'DatePublished': datePublished,
      'Description': description,
      'Images': images,
      'RecipeCategory': recipeCategory,
      'Keywords': keywords,
      'RecipeIngredientQuantities': recipeIngredientQuantities,
      'RecipeIngredientParts': recipeIngredientParts,
      'AggregatedRating': aggregatedRating,
      'ReviewCount': reviewCount,
      'Calories': calories,
      'FatContent': fatContent,
      'SaturatedFatContent': saturatedFatContent,
      'CholesterolContent': cholesterolContent,
      'SodiumContent': sodiumContent,
      'CarbohydrateContent': carbohydrateContent,
      'FiberContent': fiberContent,
      'SugarContent': sugarContent,
      'ProteinContent': proteinContent,
      'RecipeServings': recipeServings,
      'RecipeYield': recipeYield,
      'RecipeInstructions': recipeInstructions,
    };
   }

    factory Description.fromJson(Map<String, dynamic> json) => Description(
        recipeId: json["RecipeId"],
        name: json["Name"],
        authorId: json["AuthorId"],
        authorName: json["AuthorName"],
        cookTime: json["CookTime"],
        prepTime: json["PrepTime"],
        totalTime: json["TotalTime"],
        // datePublished: DateTime.parse(json["DatePublished"]),

        datePublished: json["DatePublished"],
        description: json["Description"],
        images: json["Images"],
        recipeCategory: json["RecipeCategory"],
        keywords: json["Keywords"],
        recipeIngredientQuantities: json["RecipeIngredientQuantities"],
        recipeIngredientParts: json["RecipeIngredientParts"],
        aggregatedRating: json["AggregatedRating"],
        reviewCount: json["ReviewCount"],
        calories: json["Calories"],
        fatContent: json["FatContent"],
        saturatedFatContent: json["SaturatedFatContent"],
        cholesterolContent: json["CholesterolContent"],
        sodiumContent: json["SodiumContent"],
        carbohydrateContent: json["CarbohydrateContent"],
        fiberContent: json["FiberContent"],
        sugarContent: json["SugarContent"],
        proteinContent: json["ProteinContent"],
        recipeServings: json["RecipeServings"],
        recipeYield: json["RecipeYield"],
        recipeInstructions: json["RecipeInstructions"],
    );

    
}
