import 'package:coin_api_test/pages/home/components/charting_data.dart';
import 'package:coin_api_test/pages/home/components/main_rounded_button.dart';
import 'package:coin_api_test/pages/home/components/market_data.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              //TextField(),
              Expanded(flex: 7, child: Text("data")),
              Expanded(
                flex: 3,
                child: MainRoundedButton(
                  text: "Subscribe",
                  callback: () {},
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
          const MarketData(),
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
    );
  }
}
