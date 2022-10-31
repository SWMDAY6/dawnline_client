import 'package:dawnline/app/binding/view_binding.dart';
import 'package:dawnline/app/routes/route.dart';
import 'package:dawnline/app/ui/serviceagreement_page.dart';
import 'package:dawnline/app/ui/view_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '새벽 한 줄',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ServiceAgreementPage(),
      initialBinding: ViewBinding(),
      debugShowCheckedModeBanner: false, // Hide the debug banner
      getPages: AppPages.routes,
    );
  }
}
