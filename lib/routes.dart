import 'package:farmsetu/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageRoutes {
  static List<GetPage<dynamic>> getRoutes = [
    GetPage(
      name: '/',
      transition: Transition.leftToRight,
      page: () => const Home(),
    ),
  ];
}
