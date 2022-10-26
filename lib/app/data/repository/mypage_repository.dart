import 'package:dawnline/app/data/provider/mypage_api.dart';

class MyPageRepository {
  final MyPageApi apiClient;

  MyPageRepository({required this.apiClient});

  getAll() {
    print("repository");
    return apiClient.getAll();
  }
}
