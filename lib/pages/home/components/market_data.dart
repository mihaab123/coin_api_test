import 'package:flutter/material.dart';

class MarketData extends StatelessWidget {
  const MarketData({Key? key}) : super(key: key);

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
              Text("Symbol:"),
              Text("BTN/USD"),
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
