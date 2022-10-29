import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = "http://13.124.215.169:8080/api/v1/boards/posts";

class DeletePostApi {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();
  static postRequest(String postId, String password) async {
    final response = await http.delete(
      Uri.parse("$baseUrl/$postId"),
      body: {"password": password},
    );
    if (response.statusCode == 200) {
      print("삭제완료!");
      print("responsebody${response.body}");
      final SharedPreferences prefs = await _prefs;
      final List<String> list = prefs.getStringList('PostList') ?? [];
      list.remove(postId);
      prefs.setStringList('PostList', list);
      return 1;
    }
    print("error");
    return -1;
  }
}
