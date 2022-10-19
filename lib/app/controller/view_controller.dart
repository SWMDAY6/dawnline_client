import 'package:dawnline/app/data/model/view_model.dart';
import 'package:dawnline/app/data/repository/view_repository.dart';
import 'package:get/get.dart';

class ViewController extends GetxController {
  final ViewRepository repository;
  ViewController({required this.repository});
  final _postsList = <ViewModel>[].obs;
  final _post = ViewModel.getInitialViewModel().obs;

  get postList => _postsList.value;

  set postList(value) => _postsList.value = value;

  get post => _post.value;

  set post(value) => _post.value = value;

  int cnt = 0;

  getAll() {
    repository.getAll().then((data) {
      postList = data;
      post = postList[0];
    });
  }

  void next() {
    cnt++;
    if (cnt > postList.length) {
      cnt = 0;
    }
    post = postList[cnt];
  }
}
