import 'package:dawnline/app/data/model/post_model.dart';
import 'package:dawnline/app/data/provider/post_api.dart';
import 'package:dawnline/app/ui/Widget/background_widget.dart';
import 'package:dawnline/app/ui/Widget/topbar_widget.dart';
import 'package:dawnline/app/ui/view_page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostPage extends StatelessWidget {
  var currentPosition;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final postInputController = TextEditingController();
  final passwordInputController = TextEditingController();
  static FocusNode _focus = FocusNode();
  int? response;
  bool? _keyboardVisible = true;

  Future<void> getPosition() async {
    LocationPermission permission = await Geolocator.requestPermission();
    currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print(currentPosition);
  }

  void _onFocusChange() {
    // print("Focus: ${_focus.hasFocus}");
    // _keyboardVisible = _focus.hasFocus;
    // Get.reload();
  }

  Widget _buildTextField() {
    const maxLines = 20;

    _focus.addListener(_onFocusChange);
    return Container(
      margin: const EdgeInsets.all(12),
      height: maxLines * 24.0,
      child: TextField(
        maxLines: maxLines,
        decoration: const InputDecoration(
          hintText: "여기에 내용을\n입력해주세요",
          hintStyle: TextStyle(color: Colors.white),
          fillColor: Colors.transparent,
          filled: true,
        ),
        style: const TextStyle(
          fontSize: 35,
          color: Colors.white,
        ),
        controller: postInputController,
        maxLength: 100,
      ),
    );
  }

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

  Widget _scrollSizedBox() {
    return const SizedBox(
      height: 200,
    );
  }

  Future<void> _addPostList(String key) async {
    final SharedPreferences prefs = await _prefs;
    final List<String> list = prefs.getStringList('PostList') ?? [];
    list.add(key);
    prefs.setStringList('PostList', list);
    print("shared_preferences ${list}");
  }

  postRequests(context) async {
    await getPosition();
    print(currentPosition);
    print("postInput ${postInputController.text}");
    print("passwordInput ${passwordInputController.text}");
    if (postInputController.text.isEmpty ||
        passwordInputController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('게시글 혹은 비밀번호를 작성해주세요.'),
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
      return -1;
    }
    response = await PostApi.postRequest(
      PostModel(
        content: postInputController.text,
        password: passwordInputController.text,
        latitude: currentPosition.latitude,
        longitude: currentPosition.longitude,
      ),
    );
    print(response);
    _addPostList(response.toString());
    // print("response ${response.runtimeType}");
    if (response == -1) {
      //error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('에러입니다.'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text("확인"),
                onPressed: () {},
              )
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('등록되었습니다'),
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true, // 앱 바 위에까지 침범 허용
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
        },
        child: Stack(
          children: [
            BackGroundWidget.getRandomBackgroundImage(),
            TopBarWidget.getTopBarWidget(),
            Positioned.fill(
              child: Center(
                child: Opacity(
                  opacity: 0.70,
                  child: Container(
                    width: 360,
                    height: 600,
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _buildTextField(),
                            _buildPasswordField(),
                            _scrollSizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: kBottomNavigationBarHeight,
              child: SizedBox(
                width: Get.width,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      postRequests(context);
                    },
                    icon: const Icon(
                      Icons.create,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
