import 'package:dawnline/app/data/provider/addcomment_api.dart';
import 'dart:io';
import 'package:dawnline/app/routes/route.dart';
import 'package:dawnline/app/ui/Widget/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dawnline/app/controller/view_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewPage extends GetView<ViewController> {
  final commentInputController = TextEditingController();
  getCommentCount() {
    if (controller.post.comments == null) return 0;
    return controller.post.comments.length;
  }

  Widget listview_builder() {
    if (controller.post.comments == null) {
      return Container();
    }
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8.0),
        itemCount: controller.post.comments.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.white,
            child: Text(controller.post.comments[index].content),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 10,
          color: Colors.black,
        ),
      ),
    );
  }
  addreports(String postId) async {
    // SharedPreferences prefs = await _prefs;
    final prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList('reports') ?? [];
    list.add(postId);
    print("addreports in $list");
    prefs.setStringList('reports', list);
  }
  
  Widget addCommentView() {
    return TextField(
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        hintText: '댓글을 입력해주세요',
        hintStyle: TextStyle(color: Colors.black),
      ),
      style: const TextStyle(
        color: Colors.black,
      ),
      controller: commentInputController,
    );
  }


  showAgreementDialog(context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('해당 서비스는 익명을 기반으로 의견을 나누는 페이지입니다.\n' +
                    '약관에 동의하시면 확인 버튼을 눌러주세요.\n' +
                    '동의하지 않으시면 앱의 사용이 어렵습니다.'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text("확인"),
              onPressed: () {
                controller.setAgreement();
                Get.back();
              },
            ),
            TextButton(
              child: const Text("취소"),
              onPressed: () {
                if (Platform.isIOS) {
                  exit(0);
                } else {
                  SystemNavigator.pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration.zero,
      () {
        if (controller.agreement == false) {
          showAgreementDialog(context);
        }
      },
    );

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
            Positioned(
              bottom: kBottomNavigationBarHeight + 50,
              right: 25,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.bottomSheet(
                        Expanded(
                          child: Column(
                            children: [
                              listview_builder(),
                              Row(
                                children: [
                                  Flexible(
                                    child: addCommentView(),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      addCommentApi.postRequest(
                                        commentInputController.text,
                                        controller.post.postId,
                                      );
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: SingleChildScrollView(
                                              child: ListBody(
                                                children: const <Widget>[
                                                  Text('댓글 작성이 완료되었습니다.'),
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                child: const Text("확인"),
                                                onPressed: () {
                                                  Get.back();
                                                  Get.back();
                                                  commentInputController.text =
                                                      "";
                                                  controller.getAllwithoutCnt();
                                                },
                                              )
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: const Text('등록하기'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
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
