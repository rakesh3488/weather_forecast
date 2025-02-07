import 'package:dio/dio.dart';

import 'utils/api.dart';

class Service {
  Future getWeatherData(selectedRegion, selectedParameter) async {
    try {
      print(Api.SERVER_URL + "$selectedParameter/date/$selectedRegion.txt");
      // return;
      var response = await Dio().get(
        Api.SERVER_URL + "$selectedParameter/date/$selectedRegion.txt",
      );
      return response;
    } catch (e) {
      print("Exception : " + e.toString());
      return null;
    }
  }
}
