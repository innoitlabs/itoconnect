import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:i2connect/util/app_constants.dart';
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
      print('-----------${'Bearer $token'}');
      final response =
          await http.get(Uri.parse('$baseUrl$endpoint'), headers: headers);
      debugPrint('${response.request?.url}');
      debugPrint('${response.statusCode}');
      if (response.statusCode == 200) {
        debugPrint(response.body);
        return Left(response);
      } else {
        if(response.statusCode == 401){
          if(jsonDecode(response.body)['code'] == 'token_not_valid'){
            await refreshToken(endpoint: AppConstants.refreshToken);
          }
        }
        return Right(Exception(jsonDecode(response.body)['message']));
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<Either<http.Response, Exception>> post(
      {required String endpoint, Map<String, dynamic>? data}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    print('Bearer $token');
    print(jsonEncode(data));
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(data),
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        return Left(response);
      } else {
        if(response.statusCode == 401){
          if(jsonDecode(response.body)['code'] == 'token_not_valid'){
            await refreshToken(endpoint: AppConstants.refreshToken);
          }
        }
        return Right(Exception(jsonDecode(response.body)['message']));
      }
    } catch (e) {
      return Right(Exception('Network error: $e'));
    }
  }

  Future<Either<http.Response, Exception>> delete(
      {required String endpoint, Map<String, dynamic>? data}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    print('Bearer $token');
    print(jsonEncode(data));
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(data),
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        return Left(response);
      } else {
        if(response.statusCode == 401){
          if(jsonDecode(response.body)['code'] == 'token_not_valid'){
            await refreshToken(endpoint: AppConstants.refreshToken);
          }
        }
        return Right(Exception(jsonDecode(response.body)['message']));
      }
    } catch (e) {
      return Right(Exception('Network error: $e'));
    }
  }

  Future<Either<http.Response, Exception>> patch(
      {required String endpoint, Map<String, dynamic>? data}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    print('Bearer $token');
    print(jsonEncode(data));
    try {
      final response = await http.patch(
        Uri.parse('$baseUrl$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(data),
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        return Left(response);
      } else {
        if(response.statusCode == 401){
          if(jsonDecode(response.body)['code'] == 'token_not_valid'){
            await refreshToken(endpoint: AppConstants.refreshToken);
          }
        }
        return Right(Exception(jsonDecode(response.body)['message']));
      }
    } catch (e) {
      return Right(Exception('Network error: $e'));
    }
  }

  Future<Either<http.Response, Exception>> postAuth(
      {required String endpoint, Map<String, dynamic>? data}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    print('Bearer $token');
    print(data);
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(data),
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        return Left(response);
      } else {
        if(response.statusCode == 401){
          if(jsonDecode(response.body)['code'] == 'token_not_valid'){
            await refreshToken(endpoint: AppConstants.refreshToken);
          }
        }
        return Right(Exception(jsonDecode(response.body)['message']));
      }
    } catch (e) {
      return Right(Exception('Network error: $e'));
    }
  }

  Future<Either<http.Response, Exception>> refreshToken(
      {required String endpoint, Map<String, dynamic>? data}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final refreshToken = preferences.getString('refresh');
    var data = {"refresh":refreshToken};
    print(data);
    var endpoint = 'jwt/refresh/';
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(data),
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        var accessData = jsonDecode(response.body)['access'];
        debugPrint(accessData);
        preferences.setString('token', accessData ?? "");
        return Left(response);
      } else {
        return Right(Exception(jsonDecode(response.body)['message']));
      }
    } catch (e) {
      return Right(Exception('Network error: $e'));
    }
  }

}
