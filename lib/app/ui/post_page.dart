import 'package:dawnline/app/data/model/post_model.dart';
import 'package:dawnline/app/data/provider/post_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostPage extends StatelessWidget {
  // const PostPage({super.key});
  List<String> imageList = [
    "assets/1.jpeg",
    "assets/2.jpeg",
    "assets/3.jpeg",
  ];

  Widget _buildTextField() {
    const maxLines = 20;

    return Container(
      margin: const EdgeInsets.all(12),
      height: maxLines * 24.0,
      child: TextField(
        maxLines: maxLines,
        decoration: const InputDecoration(
          hintText: "여기에 내용을\n입력해주세요",
          fillColor: Colors.transparent,
          filled: true,
        ),
        style: const TextStyle(
          fontSize: 40,
        ),
        controller: postInputController,
        maxLength: 100,
      ),
    );
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<List<String>> PostList;

  Future<void> _addPostList(String key) async {
    final SharedPreferences prefs = await _prefs;
    final List<String> list = prefs.getStringList('PostList') ?? [];
    list.add(key);
    prefs.setStringList('PostList', list);
    print("shared_preferences {$list}");
    //(prefs.getInt('counter') ?? 0) + 1;

    // _counter = prefs.setInt('counter', counter).then((bool success) {
    //   return counter;
    // });
  }

  postRequests() async {
    int response = await PostApi.postRequest(
      PostModel(
        content: postInputController.text,
        password: passwordInputController.text,
        latitude: 38.21,
        longitude: 127.11,
      ),
    );
    print(response);
    _addPostList(response.toString());
    if (response != -1) {
      return response;
    }
    return -1;
  }

  final postInputController = TextEditingController();
  final passwordInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true, // 앱 바 위에까지 침범 허용
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imageList[1]),
              ),
            ),
          ),
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
                      _buildTextField(),
                      TextField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        controller: passwordInputController,
                      ),
                    ],
                  ),
                ),
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
                      Icons.arrow_left,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      print("previous");
                      Get.back();
                    },
                  ),
                ],
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
                    print(postInputController.text);
                    print(passwordInputController.text);
                    dynamic response = postRequests();
                    if (response == -1) {
                      //error
                    } else {
                      print("alertDialogEnter");
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("등록되었습니다"),
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
                                    Get.back();
                                    Get.back();
                                  },
                                ),
                              ],
                            );
                          });
                      ;
                    }
                  },
                  icon: const Icon(
                    Icons.create,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
