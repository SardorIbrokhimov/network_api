import 'dart:convert';

import 'package:http/http.dart';
import 'package:network_api/model/post_create.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";

//http API

  static String API_GET = "/api/v1/employee/3";
  static String API_POST = "/api/v1/create";
  static String API_PUT = "/api/v1/update/"; //id
  static String API_DELETE = "/api/v1/delete/"; //id

//requests

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(
      uri,
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }


  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await put(uri, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await delete(uri,);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }




  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      "name": post.name,
      "salary": post.salary,
      "age": post.age,
    });
    return params;
  }
  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      "name": post.name,
      "salary": post.salary,
      "age": post.age,
    });
    return params;
  }
  static Map<String, String> paramsDelete() {
    Map<String, String> params = new Map();
    return params;
  }
}
