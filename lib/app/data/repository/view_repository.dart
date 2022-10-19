import 'package:dawnline/app/data/provider/view_api.dart';

class ViewRepository {
  final ViewApi apiClient;

  ViewRepository({required this.apiClient});

  getAll() {
    return apiClient.getAll();
  }
}
