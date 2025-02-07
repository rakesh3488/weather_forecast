import 'dart:convert';

import 'package:get/get.dart';
import '../services.dart';

class Controller extends GetxController {
  List weatherData = [];
  bool isLoading = false;
  String? selectedRegion;
  String? selectedParameter;
  Future<void> fetchWeatherData() async {
    try {
      isLoading = true;
      update();
      var response =
          await Service().getWeatherData(selectedRegion, selectedParameter);
      print("Data : ${response.data}");
      // return;
      List<String> lines = response.data.split('\n');

      // Remove empty lines
      lines = lines.where((line) => line.trim().isNotEmpty).toList();

      // Find the rows that start with a year (4-digit number)
      List<String> dataRows = lines
          .where((line) => RegExp(r'^\d{4}').hasMatch(line.trim()))
          .toList();

      // Get the last 5 rows, if available
      int length = dataRows.length;
      List<String> keys = [
        "year",
        "jan",
        "feb",
        "mar",
        "apr",
        "may",
        "jun",
        "jul",
        "aug",
        "sep",
        "oct",
        "nov",
        "dec"
      ];
      final lastFive = dataRows.sublist(length - 5);
      // Convert each row into a JSON object
      List<Map<String, dynamic>> jsonList = lastFive.map((row) {
        List<String> values =
            row.trim().split(RegExp(r'\s+')); // Split by spaces/tabs
        Map<String, dynamic> jsonMap = {};

        for (int i = 0; i < keys.length && i < values.length; i++) {
          jsonMap[keys[i]] = values[i]; // Assign values to respective keys
        }
        return jsonMap;
      }).toList();
      weatherData = jsonList;
      update();
      isLoading = false;
      update();
      print(weatherData);
    } catch (e) {
      print("Exception occured in fetchWeatherData method : " + e.toString());
    }
  }
}
