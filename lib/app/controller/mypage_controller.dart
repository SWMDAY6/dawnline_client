import 'package:dawnline/app/data/model/mypage_model.dart';
import 'package:dawnline/app/data/repository/mypage_repository.dart';
import 'package:get/get.dart';

class MyPageController extends GetxController {
  final MyPageRepository repository;
  MyPageController({required this.repository});
  final _postsList = <MyPageModel>[].obs;

  get postList => _postsList.value;

  set postList(value) => _postsList.value = value;

  getAll() {
    repository.getAll().then(
      (data) {
        postList = data;
      },
    );
  }
}
