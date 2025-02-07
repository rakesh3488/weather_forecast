import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../classes/weather-data.dart';
import '../../controller/controller.dart';

SfCartesianChart graphicalView(List<WeatherData> weatherResponse) {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    tooltipBehavior: TooltipBehavior(
        activationMode: ActivationMode.singleTap, enable: true, header: ""),
    backgroundColor: Colors.grey.shade100,
    title: ChartTitle(text: "Weather Forecast"),
    series: [
      LineSeries<WeatherData, dynamic>(
          dataSource: weatherResponse,
          xValueMapper: (WeatherData wd, _) {
            print("x axis : ${wd.month}");
            return wd.month;
          },
          yValueMapper: (WeatherData wd, _) => wd.reading),
    ],
  );
}

Container tabularView(Controller controller) {
  return Container(
    // width: 1500,
    height: 300,
    decoration: BoxDecoration(border: Border.all()),
    child: DataTable2(
      isHorizontalScrollBarVisible: true,
      minWidth: 1500,
      horizontalScrollController: ScrollController(),
      columns: [
        DataColumn(
          label: Text('Year'),
        ),
        DataColumn(
          label: Text(
            'Jan',
            // softWrap: true,
          ),
        ),
        DataColumn(
          label: Text('Feb'),
        ),
        DataColumn(
          label: Text('Mar'),
        ),
        DataColumn(
          label: Text('Apr'),
        ),
        DataColumn(
          label: Text('May'),
        ),
        DataColumn(
          label: Text('Jun'),
        ),
        DataColumn(
          label: Text('Jul'),
        ),
        DataColumn(
          label: Text('Aug'),
        ),
        DataColumn(
          label: Text('Sep'),
        ),
        DataColumn(
          label: Text('Oct'),
        ),
        DataColumn(
          label: Text('Nov'),
        ),
        DataColumn(
          label: Text('Dec'),
        ),
      ],
      rows: List<DataRow>.generate(controller.weatherData.length, (i) {
        var dataField = controller.weatherData[i];
        return DataRow(cells: [
          DataCell(
            Text(
              dataField['year'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataCell(Text(dataField['jan'])),
          DataCell(Text(dataField['feb'].toString() == "null"
              ? "-"
              : dataField['feb'].toString())),
          DataCell(Text(dataField['mar'].toString() == "null"
              ? "-"
              : dataField['mar'].toString())),
          DataCell(Text(dataField['apr'].toString() == "null"
              ? "-"
              : dataField['apr'].toString())),
          DataCell(Text(dataField['may'].toString() == "null"
              ? "-"
              : dataField['may'].toString())),
          DataCell(Text(dataField['jun'].toString() == "null"
              ? "-"
              : dataField['jun'].toString())),
          DataCell(Text(dataField['jul'].toString() == "null"
              ? "-"
              : dataField['jul'].toString())),
          DataCell(Text(dataField['aug'].toString() == "null"
              ? "-"
              : dataField['aug'].toString())),
          DataCell(Text(dataField['sep'].toString() == "null"
              ? "-"
              : dataField['sep'].toString())),
          DataCell(Text(dataField['oct'].toString() == "null"
              ? "-"
              : dataField['oct'].toString())),
          DataCell(Text(dataField['nov'].toString() == "null"
              ? "-"
              : dataField['nov'].toString())),
          DataCell(Text(dataField['dec'].toString() == "null"
              ? "-"
              : dataField['dec'].toString())),
        ]);
      }),
      columnSpacing: 15,
      sortColumnIndex: 1,
      fixedColumnsColor: Colors.grey.shade500,
      sortArrowIcon: Icons.arrow_upward,
      showBottomBorder: true,
    ),
  );
}
