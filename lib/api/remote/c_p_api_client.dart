import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:crosspay/models/api_response.dart';
import 'package:crosspay/utils/c_p_constants.dart';

class CPApiClient {
  final String baseUrl = CPConstants().BASE_URL!;
  final verifyHash = CPConstants().VERIFY_HASH!;
  late Map<String, String> headers;

  CPApiClient() {
    headers = {
      'Authorization': 'Bearer ',
      'Content-Type': 'application/json',
      'verify-crosspay-hash': verifyHash
    };
  }

  setAuthorization() async {
    String idToken = await getIdToken();
    headers['Authorization'] = 'Bearer $idToken';
  }

  Future<String> getIdToken() async {
    var token = await FirebaseAuth.instance.currentUser?.getIdToken();
    return token!;
  }

  Future<ApiResponse> postRequest(dynamic requestData, String apiRoute) async {
    await setAuthorization();
    try {
      var requestBody = json.encode(requestData);
      final response = await http.post(Uri.parse('$baseUrl/$apiRoute'),
          headers: headers, body: requestBody);
      if (response.statusCode == 200) {
        return ApiResponse(
            successful: true,
            statusCode: response.statusCode,
            message: 'Request successful',
            data: jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        return ApiResponse(
            successful: false,
            statusCode: response.statusCode,
            message: 'Request failed',
            error: jsonDecode(utf8.decode(response.bodyBytes)));
      }
    } on SocketException catch (e) {
      return ApiResponse(
          successful: false,
          statusCode: 444,
          message: 'No internet. Check your connection and try again',
          error: {});
    }
  }

  Future<ApiResponse> getRequest(String apiRoute) async {
    await setAuthorization();
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/$apiRoute'), headers: headers);
      if (response.statusCode == 200) {
        return ApiResponse(
            successful: true,
            statusCode: response.statusCode,
            message: 'Request successful',
            data: jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        return ApiResponse(
            successful: false,
            statusCode: response.statusCode,
            message: 'Request failed',
            error: jsonDecode(utf8.decode(response.bodyBytes)));
      }
    } on SocketException catch (e) {
      return ApiResponse(
          successful: false,
          statusCode: 444,
          message: 'No internet. Check your connection and try again',
          error: {});
    }
  }

  Future<ApiResponse> getUser(String userId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users/get/$userId'),
          headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return ApiResponse(
            successful: true,
            statusCode: response.statusCode,
            message: 'User information found',
            data: jsonDecode(utf8.decode(response.bodyBytes)));
      } else if (response.statusCode == 404) {
        return ApiResponse(
            successful: true,
            statusCode: response.statusCode,
            message: 'User information not found',
            data: jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        return ApiResponse(
            successful: false,
            statusCode: response.statusCode,
            message: 'Request failed',
            error: jsonDecode(utf8.decode(response.bodyBytes)));
      }
    } on SocketException catch (e) {
      return ApiResponse(
          successful: false,
          statusCode: 444,
          message: 'No internet. Check your connection and try again',
          error: {});
    }
  }

  Future<ApiResponse> createUser(dynamic requestData) async {
    String apiRoute = 'users/new';
    final response = await postRequest(requestData, apiRoute);
    return response;
  }
}
