import 'dart:convert';

import 'package:dawnline/app/data/model/mypage_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = "http://13.124.215.169:8080/api/v1/boards/posts/id";

class MyPageApi {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  getAll() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final List<String> list = prefs.getStringList('PostList') ?? [];

      print("mypageListEmpty${list.isEmpty}");
      if (list.isEmpty) {
        List<MyPageModel> listMyPageModel = [MyPageModel.getInitialViewModel()];
        return listMyPageModel;
      }
      print("mypageList$list");
      var response = await http.get(
        Uri.parse(baseUrl).replace(
          queryParameters: {
            'postIdList': list,
          },
        ),
      );

      if (response.statusCode != 200) {
        print("error");
        return;
      }

      Iterable jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      print(jsonResponse);
      List<MyPageModel> listMyPageModel =
          jsonResponse.map((model) => MyPageModel.fromJson(model)).toList();

      return listMyPageModel;
    } catch (_) {
      print("error");
    }
  }
}
