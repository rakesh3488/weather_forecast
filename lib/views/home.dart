import 'package:data_table_2/data_table_2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../classes/weather-data.dart';
import '../controller/controller.dart';
import 'methods/home-view-methods.dart';
import 'widgets/home-submit-button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    String? dropdownValue1;
    String? dropdownValue2;

    List<Map<String, dynamic>> items1 = [
      {'country': 'UK', 'endpoint': 'UK'},
      {'country': 'England', 'endpoint': 'England'},
      {'country': 'Wales', 'endpoint': 'Wales'},
      {'country': 'Scotland', 'endpoint': 'Scotland'},
      {'country': 'Nothern Ireland', 'endpoint': 'Northern_Ireland'},
      {'country': 'England & Wales', 'endpoint': 'England_and_Wales'},
      {'country': 'England N', 'endpoint': 'England_N'},
      {'country': 'England S', 'endpoint': 'England_S'},
      {'country': 'Scotland N', 'endpoint': 'Scotland_N'},
      {'country': 'Scotland E', 'endpoint': 'Scotland_S'},
      {'country': 'Scotland W', 'endpoint': 'Scotland_W'},
      {'country': 'England E & NE', 'endpoint': 'England_E_and_NE'},
      {'country': 'England NW/Wales N', 'endpoint': 'England_NW_and_N_Wales'},
      {'country': 'Midlands', 'endpoint': 'Midlands'},
      {'country': 'East Anglia', 'endpoint': 'East_Anglia'},
      {'country': 'England SW/Wales S', 'endpoint': 'England_SW_and_S_Wales'},
      {
        'country': 'England SE/Central S',
        'endpoint': 'England_SE_and_Central_S'
      }
    ];
    List<Map<String, dynamic>> parameters = [
      {'label': 'Max Temp', 'endpoint': 'Tmax'},
      {'label': 'Min Temp', 'endpoint': 'Tmin'},
      {'label': 'Mean Temp', 'endpoint': 'Tmean'},
      {'label': 'Sunshine', 'endpoint': 'Sunshine'},
      {'label': 'Rainfall', 'endpoint': 'Rainfall'},
      {'label': 'Rain days>1.0mm', 'endpoint': 'Raindays1mm'},
      {'label': 'Days of air frost', 'endpoint': 'AirFrost'}
    ];

    return Scaffold(
      // backgroundColor: Color(0xff454449),
      appBar: AppBar(
        title: Text(
          'Weather Report',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff2D98DA),
      ),
      body: GetBuilder<Controller>(
        builder: (controller) {
          // Assign weather data reports to 2024
          final List<WeatherData> weatherResponse =
              controller.weatherData.length == 0
                  ? []
                  : [
                      WeatherData("Jan",
                          double.parse(controller.weatherData[3]['jan'])),
                      WeatherData(
                        "Feb",
                        double.parse(
                          controller.weatherData[3]['feb'],
                        ),
                      ),
                      WeatherData(
                        "Mar",
                        double.parse(
                          controller.weatherData[3]['mar'],
                        ),
                      ),
                      WeatherData(
                        "Apr",
                        double.parse(
                          controller.weatherData[3]['apr'],
                        ),
                      ),
                      WeatherData(
                        "May",
                        double.parse(
                          controller.weatherData[3]['may'],
                        ),
                      ),
                      WeatherData(
                        "Jun",
                        double.parse(
                          controller.weatherData[3]['jun'],
                        ),
                      ),
                      WeatherData(
                        "Jul",
                        double.parse(
                          controller.weatherData[3]['jul'],
                        ),
                      ),
                      WeatherData(
                        "Aug",
                        double.parse(
                          controller.weatherData[3]['aug'],
                        ),
                      ),
                      WeatherData(
                        "Sep",
                        double.parse(
                          controller.weatherData[3]['sep'],
                        ),
                      ),
                      WeatherData(
                        "Oct",
                        double.parse(
                          controller.weatherData[3]['oct'],
                        ),
                      ),
                      WeatherData(
                        "Nov",
                        double.parse(
                          controller.weatherData[3]['nov'],
                        ),
                      ),
                      WeatherData(
                        "Dec",
                        double.parse(
                          controller.weatherData[3]['dec'],
                        ),
                      ),
                    ];

          return Container(
            padding: const EdgeInsets.all(16.0),
            height: Get.height,
            width: Get.width,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text("Region"),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        labelText: '-- Region --',
                        border: OutlineInputBorder()),
                    value: controller.selectedRegion,
                    items: items1.map((region) {
                      return DropdownMenuItem<String>(
                        value: region['endpoint'],
                        child: Text(region['country']),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      // setState(() {
                      controller.selectedRegion = newValue;
                      controller.update();
                      // });
                    },
                    validator: (value) =>
                        value == null ? 'Please select an option' : null,
                  ),
                  SizedBox(height: 20),
                  Text("Parameter"),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        labelText: '-- Parameter --',
                        border: OutlineInputBorder()),
                    value: dropdownValue2,
                    items: parameters.map((param) {
                      return DropdownMenuItem<String>(
                        value: param['endpoint'],
                        child: Text(param['label']),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      // setState(() {
                      controller.selectedParameter = newValue;
                      controller.update();
                      // });
                    },
                    validator: (value) =>
                        value == null ? 'Please select a choice' : null,
                  ),
                  SizedBox(height: 28),
                  SubmitButton(controller: controller),
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    // height: 2000,
                    // decoration: BoxDecoration(border: Border.all()),
                    child: controller.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                controller.weatherData.length > 0
                                    ? tabularView(controller)
                                    : Offstage(),
                                controller.weatherData.length > 0
                                    ? graphicalView(weatherResponse)
                                    : Offstage()
                              ],
                            ),
                          ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
