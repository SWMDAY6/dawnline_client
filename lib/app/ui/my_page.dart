import 'package:dawnline/app/controller/mypage_controller.dart';
import 'package:dawnline/app/routes/route.dart';
import 'package:dawnline/app/ui/Widget/background_widget.dart';
import 'package:dawnline/app/ui/Widget/post_widget.dart';
import 'package:dawnline/app/ui/Widget/topbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPage extends GetView<MyPageController> {
  @override
  Widget build(BuildContext context) {
    controller.getAll();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true, // 앱 바 위에까지 침범 허용
      body: Stack(
        children: [
          BackGroundWidget.getRandomBackgroundImage(),
          Center(
            child: SizedBox(
              width: 360,
              height: 600,
              child: SingleChildScrollView(
                child: Obx(
                  () => Column(
                    children: List.generate(
                      controller.postList.length,
                      (index) {
                        return PostWidget(
                          content: controller.postList[index].content,
                          callBack: () {
                            Get.toNamed(
                              Routes.DETAIL,
                              arguments: controller.postList[index] == 0
                                  ? -1
                                  : controller.postList[index],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          TopBarWidget.getTopBarWidget(),
        ],
      ),
    );
  }
}
