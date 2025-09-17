import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client client;
  ApiClient(this.client);

  Future<Map<String, dynamic>> post(
    String url,
    Map<String, String> body,
  ) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept": "application/json",
      },
      body: body,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("API Error: ${response.body}");
    }
  }
}
