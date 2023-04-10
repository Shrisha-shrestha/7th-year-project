import 'package:http/http.dart' as http;
import 'package:recipe/model/GetModelRecipeId.dart';
import 'dart:convert';
import '../model/GetPopularDescription.dart';
import '../model/GetPopularRecipeId.dart';

class APIService {
  Future<RecipeIdResponseModel?> get_recipe_id(int uid) async {
    String url = 'http://10.0.2.2:8889/contentbasedrecommend?uid=$uid';
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      RecipeIdResponseModel responseModel =
          RecipeIdResponseModel.fromJson(json.decode(response.body));
      return responseModel;
    } else {
      throw Exception('Error fetching data');
    }
  }

  Future<ModelBasedResponsemodel?> get_recipe_id2(int uid) async {
    String url = 'http://10.0.2.2:8889/modelbasedrecommend?uid=$uid';
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      ModelBasedResponsemodel responseModel =
          ModelBasedResponsemodel.fromJson(json.decode(response.body));
      return responseModel;
    } else {
      throw Exception('Error fetching data');
    }
  }

  Future<RecipeDescriptionResponseModel?> getpopulardescription(
      int? uid1, int? uid2, int? uid3, int? uid4, int? uid5) async {
    String url =
        'http://10.0.2.2:8889/getrecipes?uid1=$uid1&uid2=$uid2&uid3=$uid3&uid4=$uid4&uid5=$uid5';
    final response = await http.get(
      Uri.parse(url),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      RecipeDescriptionResponseModel responseModel =
          RecipeDescriptionResponseModel.fromJson(json.decode(response.body));
      return responseModel;
    } else {
      throw Exception('Error fetching data');
    }
  }
}
