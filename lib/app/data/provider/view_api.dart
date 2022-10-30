import 'dart:convert';

import 'package:dawnline/app/data/model/view_model.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://13.124.215.169:8080/api/v1/boards/posts";

class ViewApi {
  getAll() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        // print(jsonResponse);
        // print(ViewModel.fromJson(jsonResponse[1]));
        List<ViewModel> listViewModel =
            jsonResponse.map((model) => ViewModel.fromJson(model)).toList();
        // print("123$listViewModel");
        return listViewModel;
      } else {
        print("error");
      }
    } catch (_) {
      // print(_.toString());
      print("error");
    }
  }
}
