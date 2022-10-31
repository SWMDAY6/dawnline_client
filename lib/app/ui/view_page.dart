import 'package:dawnline/app/routes/route.dart';
import 'package:dawnline/app/ui/Widget/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dawnline/app/controller/view_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewPage extends GetView<ViewController> {
  addreports(String postId) async {
    // SharedPreferences prefs = await _prefs;
    final prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList('reports') ?? [];
    list.add(postId);
    print("addreports in $list");
    prefs.setStringList('reports', list);
  }

  @override
  Widget build(BuildContext context) {
    controller.getAll();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true, // 앱 바 위에까지 침범 허용
      body: Obx(
        () => Stack(
          children: [
            BackGroundWidget.getRandomBackgroundImage(),
            Center(
              child: Opacity(
                opacity: 0.70,
                child: Container(
                  width: 360,
                  height: 600,
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '${controller.post.content}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: kBottomNavigationBarHeight,
              child: SizedBox(
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_left,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        controller.previous();
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.create,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.POST);
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        controller.next();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 60,
              child: SizedBox(
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.list,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.MYPAGE);
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text(
                                      '신고하시겠습니까?\n신고하시면 해당 글은 차단되며 서버로 데이터가 전송됩니다.\n글은 관리자의 검토를 거쳐 삭제될 수 있습니다.',
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text("확인"),
                                  onPressed: () {
                                    addreports(
                                        controller.post.postId.toString());
                                    controller.next();
                                    Get.back();
                                  },
                                ),
                                TextButton(
                                  child: const Text("취소"),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.report,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
