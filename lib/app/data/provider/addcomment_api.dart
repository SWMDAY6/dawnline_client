import 'dart:convert';

import 'package:dawnline/app/data/model/comment_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = "http://13.124.215.169:8080/api/v1/posts/comments";

class addCommentApi {
  static postRequest(content, postId) async {
    http.Response response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, dynamic>{
        'postId': postId,
        'content': content,
        'password': "1234",
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
