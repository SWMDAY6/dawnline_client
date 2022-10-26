import 'dart:math';

import 'package:dawnline/app/data/provider/view_api.dart';
import 'package:dawnline/app/data/repository/view_repository.dart';
import 'package:dawnline/app/routes/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:dawnline/app/controller/view_controller.dart';

class ViewPage extends GetView<ViewController> {
  // final controller = Get.find<ViewController>();
  // Get.put(ViewController(repository: ViewRepository(apiClient: ViewApi())));
  List<String> imageList = [
    "assets/1.jpeg",
    "assets/2.jpeg",
    "assets/3.jpeg",
  ];

  Future<Position> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  @override
  Widget build(BuildContext context) {
    Random rnd = Random();
    int min = 0;
    int max = imageList.length;
    int r = min + rnd.nextInt(max - min);
    print(r);
    // Future<Position> current = getCurrentLocation();
    // current
    //     .then(((value) => print('val: ${value.latitude}, ${value.longitude}')))
    //     .catchError((error) {
    //   print(error);
    // });
    controller.getAll();
    print(controller.post);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true, // 앱 바 위에까지 침범 허용
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imageList[r]),
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
                      Obx(
                        () => Text('${controller.post.content}',
                            style: Theme.of(context).textTheme.headline4,
                            textAlign: TextAlign.center),
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
                      color: Colors.black,
                    ),
                    onPressed: () {
                      print("previous");
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.create,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.POST);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_right,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      controller.next();
                      print("next");
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
                      color: Colors.black,
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
    );
  }
}
