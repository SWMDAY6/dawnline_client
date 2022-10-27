import 'package:dawnline/app/routes/route.dart';
import 'package:dawnline/app/ui/Widget/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dawnline/app/controller/view_controller.dart';

class ViewPage extends GetView<ViewController> {
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
                            fontSize: 30,
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
              // top button
              top: 60,
              child: SizedBox(
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.my_library_books,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.MYPAGE);
                      },
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
