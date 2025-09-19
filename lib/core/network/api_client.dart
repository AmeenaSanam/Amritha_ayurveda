import 'dart:convert';

import 'package:amritha_ayurveda/core/storage/auth_storage.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@Singleton()
class ApiClient {
  AuthStorage authStorage=AuthStorage();

  Future<Map<String, dynamic>> post(
    String url,
    Map<String, dynamic> body,
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

 Future<Map<String, dynamic>> get(
    String url
  ) async {
    String token=await authStorage.getAuthToken();
    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization":'Bearer $token',
        "Accept": "application/json",
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load data: ${response.body}");
    }
  }

}
