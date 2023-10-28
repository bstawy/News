import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/core/constants.dart';

import '../../models/source_model.dart';

class ApiManager {
  static Future<SourceModel> fetchSource(String categoryId) async {

    // create query parameters to filter api's response
    Map<String, dynamic> queryParameters = {
      'apiKey': Constants.apiKey,
      'category': 'categoryId',
    };

    Uri uri = Uri.https(
      Constants.baseURL,
      '/v2/top-headlines/sources',
      queryParameters,
    );

    var response = await http.get(uri);

    var sourceData = SourceModel.fromJson(jsonDecode(response.body));

    if(response.statusCode == 200 && sourceData.status == 'ok')  {

      return sourceData;

    } else {

      throw Exception('Failed to load sources');

    }
  }





}
