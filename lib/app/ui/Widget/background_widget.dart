import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackGroundWidget {
  static Widget getRandomBackgroundImage() {
    List<String> imageList = [
      "assets/1.jpeg",
      "assets/2.jpeg",
      "assets/3.jpeg",
      "assets/australia-g41a951ed0_1920.jpg",
      "assets/car-lights-gae4cde5d9_1920.jpg",
      "assets/castle-g61f5fe1dc_1920.jpg",
      "assets/chapel-g966d8de05_1920.jpg",
      "assets/city-gebc133e65_1920.jpg",
      "assets/cosmos-gcc5631ced_1920.jpg",
      "assets/damselfly-gce39889fa_1920.jpg",
      "assets/dark-g4fadc73a3_1920.jpg",
      "assets/eiffel-tower-ge8bf20589_1920.jpg",
      "assets/estonia-g0e5b36f01_1920.jpg",
      "assets/fire-gaae60ac9b_1920.jpg",
      "assets/galaxy-g75a29792e_1920.jpg",
      "assets/galaxy-g9505d360a_1920.jpg",
      "assets/heaven-g5666f41e3_1920.jpg",
      "assets/iceland-g5e5df6cd8_1920.jpg",
      "assets/lake-g104139733_1920.jpg",
      "assets/lantern-g15631b511_1920.jpg",
      "assets/lighthouse-gf680e6861_1920.jpg",
      "assets/milky-way-g0538ca902_1920.jpg",
      "assets/milky-way-g088468cdb_1920.jpg",
      "assets/milky-way-g0d0b20c40_1920.jpg",
      "assets/milky-way-g1a90211c1_1920.jpg",
      "assets/milky-way-g1fbb952f9_1280.jpg",
      "assets/milky-way-g21d6c384c_1920.jpg",
      "assets/milky-way-g977858048_1920.jpg",
      "assets/milky-way-g9d5476bb3_1920.jpg",
      "assets/milky-way-gbaf95385c_1920.jpg",
      "assets/milky-way-gdfcf99646_1920.jpg",
      "assets/milky-way-ge164c151a_1920.jpg",
      "assets/milkyway-g5b7857de2_1920.jpg",
      "assets/moon-gb93d15922_1920.jpg",
      "assets/mountain-g99ea3a031_1920.jpg",
      "assets/mountains-gd0844856b_1920.jpg",
      "assets/new-york-city-g721af0f48_1920.jpg",
      "assets/new-york-g2310d4871_1920.jpg",
      "assets/night-g2ff9a1f3d_1920.jpg",
      "assets/night-g44cffe30a_1920.jpg",
      "assets/night-gd2fbaf7a1_1920.jpg",
      "assets/night-ge4b65b971_1920.jpg",
      "assets/night-geb621f9dc_1920.jpg",
      "assets/night-sky-g10ee7f3e3_1920.jpg",
      "assets/night-sky-g13e2eade6_1920.jpg",
      "assets/night.jpg",
      "assets/prague-ge8f8c3f94_1920.jpg",
      "assets/road-ge20d4942a_1920.jpg",
      "assets/sea-g124171250_1920.jpg",
      "assets/sea-gfae432705_1920.jpg",
      "assets/sky-g394f55bfd_1920.jpg",
      "assets/sky-g689646643_1280.jpg",
      "assets/sky-g916242094_1920.jpg",
      "assets/star-gc0658a6a1_1920.jpg",
      "assets/starry-sky-g3caea1fbd_1920.jpg",
      "assets/starry-sky-g7a9e55293_1920.jpg",
      "assets/stars-g0f41cb0be_1920.jpg",
      "assets/stars-ga70977aff_1920.jpg",
      "assets/stars-gb645f5a36_1920.jpg",
      "assets/street-g39147ad9a_1920.jpg",
      "assets/street-gdc08a515b_1920.jpg",
      "assets/sunset-geeecf1940_1920.jpg",
      "assets/sweden-g0f327a0df_1920.jpg",
      "assets/toulouse-g23dc9d995_1920.jpg",
      "assets/tree-gaa6c7081c_1920.jpg",
    ];
    Random rnd = Random();
    int r = rnd.nextInt(imageList.length);
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageList[r]),
        ),
      ),
    );
  }
}
