import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;

class ApiProvider{

  Future<http.Response> sendGetApi (String baseUrl)async{
    var uriConverter = Uri.parse(baseUrl);
    var response = await http.get(uriConverter);
    return response;
  }

  Future<http.Response> postData(
      String url,
      Map<String, String> headers,
      Map<String, dynamic> params,
      ) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: params,
      );

      return response;
      // if (response.statusCode == 200) {
      //   final data = json.decode(response.body);
      //   return data;
      // } else {
      //
      //   throw Exception('Failed to update data: ${response.statusCode}');
      // }
    } catch (e) {

      throw Exception('Failed to update data: $e');
    }
  }

}