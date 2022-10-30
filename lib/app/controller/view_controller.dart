import 'package:dawnline/app/data/model/view_model.dart';
import 'package:dawnline/app/data/repository/view_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final ViewRepository repository;
  ViewController({required this.repository});
  final _postsList = <ViewModel>[].obs;
  final _post = ViewModel.getInitialViewModel().obs;

  get postList => _postsList.value;

  set postList(value) => _postsList.value = value;

  get post => _post.value;

  set post(value) => _post.value = value;

  int cnt = 0;

  getAll() async {
    SharedPreferences prefs = await _prefs;
    List<String> list = prefs.getStringList('reports') ?? [];
    repository.getAll().then(
      (data) {
        postList = data;
        print(list);
        print(postList[cnt].postId);
        cnt = postList.length;
        while (true) {
          cnt--;
          if (cnt < 0) {
            cnt = postList.length - 1;
          }
          if (list.contains(postList[cnt].postId.toString()) == false) break;
        }
        post = postList[cnt];
      },
    );
  }

  void previous() async {
    SharedPreferences prefs = await _prefs;
    List<String> list = prefs.getStringList('reports') ?? [];

    while (true) {
      cnt++;
      if (cnt >= postList.length) {
        cnt = 0;
      }
      if (list.contains(postList[cnt].postId.toString()) == false) break;
    }
    post = postList[cnt];
  }

  void next() async {
    SharedPreferences prefs = await _prefs;
    List<String> list = prefs.getStringList('reports') ?? [];
    print(list);
    print(postList[cnt].postId);
    while (true) {
      cnt--;
      if (cnt < 0) {
        cnt = postList.length - 1;
      }
      if (list.contains(postList[cnt].postId.toString()) == false) break;
    }
    post = postList[cnt];
  }
}
