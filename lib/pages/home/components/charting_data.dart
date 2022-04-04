import 'package:coin_api_test/controllers/coin_hystory_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartingData extends StatelessWidget {
  final CoinHystoryController _coinHystoryController =
      Get.find<CoinHystoryController>();
  ChartingData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1, //
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries>[
              SplineSeries<ChartData, String>(
                  dataSource: List.generate(
                      _coinHystoryController.hystoryList.length, (index) {
                    return ChartData(
                        _coinHystoryController
                            .hystoryList[index].time_period_end.day
                            .toString(),
                        _coinHystoryController.hystoryList[index].rate_close);
                  }),
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y)
            ]),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
