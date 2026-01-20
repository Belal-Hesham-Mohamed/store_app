import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<List<dynamic>> apiGet(String endpoint) async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/$endpoint'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to load data from $endpoint: ${response.statusCode}');
    }
  }

  Future<dynamic> post({
    required String url,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
  print( 'body: $body , token: $token , url: $url , headers: $headers ');
    final response = await http.post(
      Uri.parse('https://fakestoreapi.com/$url'),
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Response body: ${response.body}');
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to post data to $url: ${response.statusCode}');
    }
  }

  Future<dynamic> put({
    required String url,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    final response = await http.put(
      Uri.parse('https://fakestoreapi.com/$url'),
      
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
      
    } else {
      throw Exception(
          'Failed to update data at $url: ${response.statusCode}');
    }
  }
}
