import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class InterceptedHTTP {
  final storage = FlutterSecureStorage();

  Map<String, String> headers = {};

  InterceptedHTTP();

  Future<dynamic> postHttp(String baseURL, var data) async {
    var postResponse =
        await http.post(Uri.parse(baseURL), body: jsonEncode(data), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${await storage.read(key: "token")}",
    });
    print("Response body from postHTTP ${postResponse.body}");
    var postedResponse = await postResponse;
    return postedResponse;
  }

  Future<dynamic> getHttp(String baseURL, var data) async {
    var getResponse = await http.get(Uri.parse(baseURL), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${await storage.read(key: "token")}",
    });
    print("Response body from getHTTP ${getResponse.body}");
    var gettedResponse = await getResponse;
    return gettedResponse;
  }
}
