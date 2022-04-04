import 'package:coin_api_test/controllers/coin_hystory_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarketData extends StatelessWidget {
  final CoinHystoryController _coinHystoryController =
      Get.find<CoinHystoryController>();
  MarketData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1, //
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            children: [
              const Text("Symbol:"),
              Obx(() {
                return Text(_coinHystoryController.symbol.value);
              }),
            ],
          ),
          Column(
            children: [
              Text("Price:"),
              Text("\$48"),
            ],
          ),
          Column(
            children: [
              Text("Time:"),
              Text("BTN/USD"),
            ],
          )
        ]),
      ),
    );
  }
}
