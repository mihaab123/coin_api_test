import 'package:coin_api_test/controllers/coin_hystory_controller.dart';
import 'package:coin_api_test/pages/home/components/charting_data.dart';
import 'package:coin_api_test/pages/home/components/main_rounded_button.dart';
import 'package:coin_api_test/pages/home/components/market_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBody extends StatelessWidget {
  final CoinHystoryController _coinHystoryController =
      Get.put(CoinHystoryController());
  HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                //TextField(),
                Expanded(
                  flex: 7,
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'BTC/USD',
                        labelText: "Choose assets"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: MainRoundedButton(
                    text: "Subscribe",
                    callback: () {
                      var listCoin = (nameController.text.split('/'));
                      _coinHystoryController.loadData(listCoin[0], listCoin[1]);
                    },
                    padding: 20,
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Market data:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            MarketData(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Charting data:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ChartingData(),
          ],
        ),
      ),
    );
  }
}
