import 'dart:convert';

import 'package:dawnline/app/data/model/post_model.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://13.124.215.169:8080/api/v1/boards/posts";

class PostApi {
  static postRequest(PostModel p) async {
    http.Response response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, dynamic>{
        'content': p.content,
        'password': p.password,
        'longitude': p.longitude,
        'latitude': p.latitude,
      }),
    );
    if (response.statusCode == 200) {
      // print("response" + response.body);
      return int.parse(response.body);
    } else {
      // print("error");
    }
    return -1;
  }
}
