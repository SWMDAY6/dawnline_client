// ignore_for_file: constant_identifier_names
import 'package:dawnline/app/binding/mypage_binding.dart';
import 'package:dawnline/app/binding/view_binding.dart';
import 'package:dawnline/app/ui/my_page.dart';
import 'package:dawnline/app/ui/post_page.dart';
import 'package:dawnline/app/ui/view_page.dart';
import 'package:get/route_manager.dart';

abstract class Routes {
  static const INITIAL = '/';
  static const POST = '/post';
  static const MYPAGE = '/mypage';
}

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => ViewPage(),
      binding: ViewBinding(),
    ),
    GetPage(
      name: Routes.POST,
      page: () => PostPage(),
    ),
    GetPage(
      name: Routes.MYPAGE,
      page: () => MyPage(),
      binding: MyPageBinding(),
    ),
  ];
}
