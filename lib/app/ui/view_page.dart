import 'package:dawnline/app/routes/route.dart';
import 'package:dawnline/app/ui/Widget/background_widget.dart';
import 'package:dawnline/app/ui/Widget/comment_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dawnline/app/controller/view_controller.dart';

class ViewPage extends GetView<ViewController> {
  getCommentCount() {
    if (controller.post.comments == null) return 0;
    return controller.post.comments.length;
  }

  Widget listview_builder() {
    if (controller.post.comments == null) {
      return Container();
    }
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: controller.post.comments.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.black,
          child: Text(controller.post.comments[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        height: 10,
        color: Colors.black,
      ),
    );
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
            Positioned(
              bottom: kBottomNavigationBarHeight + 50,
              right: 25,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.bottomSheet(
                        Column(
                          children: [
                            // const SizedBox(height: 20),
                            ListView(
                              padding: EdgeInsets.all(8.0),
                              children: [
                                Expanded(
                                  child: listview_builder(),
                                )
                              ],
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                      // showModalBottomSheet<void>(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return Container(
                      //       height: 500,
                      //       color: Colors.white,
                      //       child: Center(
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: <Widget>[
                      //             SingleChildScrollView(
                      //               child: ListView(
                      //                 children: List.generate(
                      //                   controller.post.comments.length,
                      //                   (index) => CommentWidget(
                      //                     content: controller
                      //                         .post.comments[index].content,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // );
                    },
                    icon: const Icon(
                      Icons.comment,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    getCommentCount().toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
