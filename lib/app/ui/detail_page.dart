import 'package:dawnline/app/data/provider/deletepost_api.dart';
import 'package:dawnline/app/ui/Widget/background_widget.dart';
import 'package:dawnline/app/ui/Widget/topbar_widget.dart';
import 'package:dawnline/app/ui/view_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final passwordInputController = TextEditingController();

  Widget _buildPasswordField() {
    return TextField(
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        hintText: 'Password',
        hintStyle: TextStyle(color: Colors.white),
      ),
      obscureText: true,
      style: const TextStyle(
        color: Colors.white,
      ),
      controller: passwordInputController,
    );
  }

  Future<void> DeletePost(
    String postId,
    String password,
    BuildContext context,
  ) async {
    final response = await DeletePostApi.postRequest(postId, password);
    if (response == 1) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('삭제가 완료되었습니다.'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text("확인"),
                onPressed: () {
                  Get.offAll(ViewPage());
                },
              )
            ],
          );
        },
      );
      return;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('삭제에 실패하였습니다. 비밀번호를 확인해주세요.'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text("확인"),
              onPressed: () {
                Get.back();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true, // 앱 바 위에까지 침범 허용
      body: Stack(
        children: [
          BackGroundWidget.getRandomBackgroundImage(),
          Center(
            child: Opacity(
              opacity: 0.70,
              child: Column(
                children: [
                  Container(
                    width: 360,
                    height: 600,
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '${Get.arguments.content}',
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
                  _buildPasswordField(),
                  TextButton(
                    onPressed: () {
                      // Respond to button press
                      DeletePost(
                        Get.arguments.postId.toString(),
                        passwordInputController.text,
                        context,
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text(
                      "삭제하기",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  TopBarWidget.getTopBarWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
