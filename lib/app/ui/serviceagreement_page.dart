import 'package:dawnline/app/ui/Widget/background_widget.dart';
import 'package:dawnline/app/ui/view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ServiceAgreementPage extends StatelessWidget {
  const ServiceAgreementPage({super.key});
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
                Get.offAll(ViewPage());
              },
            ),
            TextButton(
              child: const Text("취소"),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundWidget.getRandomBackgroundImage(),
          Center(
            child: TextButton(
              onPressed: () {
                showAgreementDialog(context);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 30),
              ),
              child: const Text('눌러서 약관 확인하기'),
            ),
          ),
        ],
      ),
    );
  }
}
