import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/core/constants.dart';

import '../../models/article_model.dart';
import '../../models/source_model.dart';

class ApiManager {
  static Future<SourceModel> fetchSource(String categoryId) async {

    // create query parameters to filter api's response
    Map<String, dynamic>? queryParameters = {
      "apiKey": Constants.apiKey,
      "category": "categoryId",
    };

    Uri uri = Uri.https(
      Constants.baseURL,
      "/v2/top-headlines/sources",
      queryParameters,
    );

    var response = await http.get(uri);

    SourceModel sourceData = SourceModel.fromJson(jsonDecode(response.body));

    print(response.body);

    return sourceData;
  }

  static Future<ArticlesModel> fetchArticles(String sourceId) async {
    Map<String, dynamic>? queryParameters = {
      "apiKey": Constants.apiKey,
      "sources": sourceId,
    };

    Uri uri = Uri.https(
      Constants.baseURL,
      "/v2/top-headlines",
      queryParameters,
    );

    var response = await http.get(uri);

    ArticlesModel articleModel =
    ArticlesModel.fromJson(jsonDecode(response.body));

    print(response.body);

    return articleModel;

  }

}