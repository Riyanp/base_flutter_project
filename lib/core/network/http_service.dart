import 'dart:convert';
import 'dart:developer';

import 'package:base_flutter_project/core/app_config.dart';
import 'package:base_flutter_project/core/constants.dart';
import 'package:base_flutter_project/core/extensions/string_ext.dart';
import 'package:base_flutter_project/core/models/error_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

class HttpService {
  Future<Either<Response, ErrorException>> requestAPI({
    required String endpoint,
    required Method method,
    Map<String, dynamic>? params,
  }) async {
    Response? response;
    params?.removeWhere((key, value) => value == null || value == "");
    String requestBody = json.encode(params);
    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    var uri = getUri(endpoint, null);
    var headers = getHeaders(sharedPref);

    // Log the request.
    log("REQUEST : $method | ${uri.toString()}");
    log("HEADER : $method |  ${uri.toString()} | $headers | $params");
    log("BODY : ${uri.toString()} | $requestBody");

    try {
      response = await getResponseBasedOnHttpMethod(
        method,
        uri,
        headers,
        requestBody,
        endpoint,
        params,
      );

      if (response.statusCode == 200) {
        log("SUCCESS : $method | ${uri.toString()} | ${response.body}");
        return Left(response);
      } else if (response.statusCode == 401) {
        logError(response.statusCode, response.body);
        return Right(
          ErrorException(
            code: response.statusCode,
            message: "Anda tidak mempunyai hak akses",
          ),
        );
      } else if (response.statusCode == 422) {
        logError(response.statusCode, response.body);
        return Right(
          ErrorException(
            code: response.statusCode,
            message: jsonDecode(response.body)['meta']['message'].toString(),
          ),
        );
      } else if (response.statusCode == 500) {
        logError(response.statusCode, response.body);
        return Right(
          ErrorException(
            code: response.statusCode,
            message: "Maaf, server kami sedang bermasalah.",
          ),
        );
      } else {
        logError(response.statusCode, response.body);
        return Right(
          ErrorException(
            code: response.statusCode,
            message: "Maaf, server kami sedang bermasalah.",
          ),
        );
      }
    } on FormatException catch (e) {
      log("API Error : $e");
      return Right(
        ErrorException(
          code: 1001,
          message: "Maaf, server kami sedang bermasalah.",
        ),
      );
    } catch (e) {
      log("API Error : $e");
      return Right(
        ErrorException(
          code: 1002,
          message: "Maaf, server kami sedang bermasalah.",
        ),
      );
    }
  }

  Uri getUri(String url, Map<String, dynamic>? params) {
    var baseUrl = dotenv.env['BASE_URL'].orEmpty;
    if (params != null) {
      var queryString = "";
      params.forEach((key, value) {
        queryString += "$key=$value&";
      });
      return Uri.parse("$baseUrl$url?$queryString");
    }
    return Uri.parse("$baseUrl$url");
  }

  Map<String, String> getHeaders(SharedPreferences sharedPref) {
    var headers = {"Content-Type": "application/json"};
    var accessToken = sharedPref.getString(Constants.accessToken);

    if (accessToken != null) {
      headers.putIfAbsent("Authorization", () => "Bearer $accessToken");
    }

    return headers;
  }

  Future<Response> getResponseBasedOnHttpMethod(
    Method method,
    Uri uri,
    Map<String, String> headers,
    String requestBody,
    String url,
    Map<String, dynamic>? params,
  ) async {
    Response response;
    final encoding = Encoding.getByName('utf-8');
    if (method == Method.POST) {
      response = await http.post(
        uri,
        headers: headers,
        body: requestBody,
        encoding: encoding,
      );
    } else if (method == Method.DELETE) {
      response = await http.delete(
        uri,
        headers: headers,
        encoding: encoding,
      );
    } else if (method == Method.PATCH) {
      response = await http.patch(
        uri,
        headers: headers,
        body: requestBody,
        encoding: encoding,
      );
    } else {
      response = await http.get(getUri(url, params), headers: headers);
    }

    return response;
  }

  void logError(int errorCode, String message) {
    print("Error Code : $errorCode, Message : $message");
  }
}
