
class RecipeIdResponseModel {
    RecipeIdResponseModel({
        required this.recipeId,
    });

    Map<String, int> recipeId;

    factory RecipeIdResponseModel.fromJson(Map<String, dynamic> json) => RecipeIdResponseModel(
        recipeId: Map.from(json["RecipeId"]).map((k, v) => MapEntry<String, int>(k, v)),
    );
}
