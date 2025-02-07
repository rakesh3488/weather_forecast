import 'package:farmsetu/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';
import 'views/page-not-found.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    return GetMaterialApp(
      title: 'Weather Report',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      getPages: PageRoutes.getRoutes,
      unknownRoute: GetPage(
        name: "/page-not-found",
        page: () => const PageNotFound(),
      ),
      initialRoute: "/",
      enableLog: false,
    );
  }
}
