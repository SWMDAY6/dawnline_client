import 'package:dawnline/app/controller/mypage_controller.dart';
import 'package:dawnline/app/data/provider/mypage_api.dart';
import 'package:dawnline/app/data/repository/mypage_repository.dart';
import 'package:get/instance_manager.dart';

class MyPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MyPageController>(
      MyPageController(
        repository: MyPageRepository(
          apiClient: MyPageApi(),
        ),
      ),
    );
  }
}
