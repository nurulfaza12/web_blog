import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:web_blog/constants.dart';

class ApiService {
  Future<http.Response> get({
    required String path,
  }) async {
    Uri uri = Uri.parse(Constant.baseUrl + path);
    final response = await http.get(
      uri,
      headers: {'content-type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return response;
    }
    if (kDebugMode) {
      print(
          'Request $uri failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
    }
    throw response;
  }
}
