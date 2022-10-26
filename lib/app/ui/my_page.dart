import 'package:dawnline/app/controller/mypage_controller.dart';
import 'package:dawnline/app/routes/route.dart';
import 'package:dawnline/app/ui/Widget/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPage extends GetView<MyPageController> {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    // MyPageApi p = new MyPageApi();
    // p.getAll();
    controller.getAll();
    // String st = controller.postList[1].content;
    String st = "123";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true, // 앱 바 위에까지 침범 허용
      body: Center(
        child: Container(
            width: 360,
            height: 700,
            child: SingleChildScrollView(
              child: Obx(
                () => Column(
                  children: List.generate(
                    controller.postList.length,
                    (index) {
                      // 부모에서 JsonLoader binding
                      // 컨트롤러에서 만든 리스트를 post에 저장
                      // var post = controller.postList[index]['content'];
                      print("index${controller.postList[index].content}");
                      return PostWidget(
                          content: controller.postList[index].content,
                          callBack: () {
                            Get.toNamed(Routes.MYPAGE);
                          });
                      // return PostWidget(
                      //   uid: post['uid']!,
                      //   thumbnail: post['thumbnail']!,
                      //   title: post['title']!,
                      //   description: post['description']!,
                      //   callBack: () {
                      //     // detail 페이지로 이동시 파라미터로 해당 위젯의 post 넘겨줌
                      //     Get.toNamed('/detail', parameters: post);
                      //   },
                      // );
                    },
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
