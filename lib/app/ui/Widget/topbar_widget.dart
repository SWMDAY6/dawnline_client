import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopBarWidget {
  static Widget getTopBarWidget() {
    return Positioned(
      top: 60,
      child: SizedBox(
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_left,
                color: Colors.white,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
