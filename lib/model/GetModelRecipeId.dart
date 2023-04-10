import 'dart:convert';

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

class ModelBasedResponsemodel {
    ModelBasedResponsemodel({
        required this.userRatings,
        required this.userPredictions,
    });

    Map<String, double> userRatings;
    Map<String, double> userPredictions;

    factory ModelBasedResponsemodel.fromJson(Map<String, dynamic> json) => ModelBasedResponsemodel(
        userRatings: Map.from(json["user_ratings"]).map((k, v) => MapEntry<String, double>(k, v)),
        userPredictions: Map.from(json["user_predictions"]).map((k, v) => MapEntry<String, double>(k, v)),
    );

  }
