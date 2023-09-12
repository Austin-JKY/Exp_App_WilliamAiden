import 'package:flutter/material.dart';
import 'package:my_app_fi/core/utils/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: size.width,
      height: 350,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <SplineSeries<MarketData, String>>[
          SplineSeries<MarketData, String>(
            dataSource: <MarketData>[
              MarketData('Mon', 50),
              MarketData('Tue', 600),
              MarketData('Thu', 500),
              MarketData('Wen', 200),
              MarketData('Fri', 400),
            ],
            color: homeBody,
            width: 2,
            xValueMapper: (MarketData data, _) => data.year,
            yValueMapper: (MarketData data, _) => data.market,
          ),
        ],
      ),
    );
  }
}

class MarketData {
  MarketData(this.year, this.market);
  String year;
  int market;
}
