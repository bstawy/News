import 'package:http/http.dart' as http;
import 'package:news/core/constants.dart';

class ApiManager {
  static Future<http.Response> fetchSource(String categoryId) async {

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
    return response;
  }
}
