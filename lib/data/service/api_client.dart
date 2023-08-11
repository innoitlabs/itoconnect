import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class APIClient {
  final String baseUrl;

  APIClient({required this.baseUrl});

  Future<Either<http.Response, Exception>> get(
      {required String endpoint}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      final response =
          await http.get(Uri.parse('$baseUrl$endpoint'), headers: headers);

      if (response.statusCode == 200) {
        return Left(response);
      } else {
        return Right(Exception(jsonDecode(response.body)['message']));
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<Either<http.Response, Exception>> post(
      {required String endpoint, Map<String, dynamic>? data}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        return Left(response);
      } else {
        return Right(Exception(jsonDecode(response.body)['message']));
      }
    } catch (e) {
      return Right(Exception('Network error: $e'));
    }
  }
}