import 'package:dawnline/app/controller/view_controller.dart';
import 'package:dawnline/app/data/repository/view_repository.dart';
import 'package:dawnline/app/data/provider/view_api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class ViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ViewController>(ViewController(
      repository: ViewRepository(
        apiClient: ViewApi(),
      ),
    ));
  }
}
