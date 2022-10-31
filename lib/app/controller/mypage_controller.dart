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
        if (data[0].content == "") {
          print("data is null");
          postList = [
            MyPageModel(
              postId: 0,
              content: "작성하신 글이 없습니다",
              latitude: 38.0,
              longitude: 122.0,
              createdAt: "2022-10-30T07:43:52.705478",
              modifiedAt: "2022-10-30T07:43:52.705478",
            )
          ];
        } else {
          postList = data;
        }
      },
    );
  }
}
