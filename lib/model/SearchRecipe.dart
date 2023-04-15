import 'dart:convert';

class SearchResponseModel {
    SearchResponseModel({
        required this.results,
    });

    String results;

    factory SearchResponseModel.fromJson(Map<String, dynamic> json) => SearchResponseModel(
        results: json["results"],
    );


}