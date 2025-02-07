import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({
    super.key,
    required this.controller,
  });
  Controller controller;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: controller.selectedParameter == null &&
              controller.selectedParameter == null
          ? () {}
          : () {
              controller.fetchWeatherData();
            },
      child: Center(
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: controller.selectedParameter == null &&
                    controller.selectedParameter == null
                ? Colors.grey
                : Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Text(
            'Submit',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
