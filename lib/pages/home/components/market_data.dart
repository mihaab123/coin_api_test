import 'package:coin_api_test/models/coin_rate.dart';
import 'package:coin_api_test/services/coin_api.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

class MarketData extends StatefulWidget {
  MarketData({
    Key? key,
  }) : super(key: key);

  @override
  State<MarketData> createState() => _MarketDataState();
}

class _MarketDataState extends State<MarketData> {
  @override
  void initState() {
    /*channel.sink.add({
      "type": "hello",
      "apikey": "4A1800B6-D40E-43BC-AAA9-D3808B07B2F4",
      "heartbeat": false,
      "subscribe_data_type": ["exrate"],
      "subscribe_filter_asset_id": ["BTC/USD"]
    });*/
    super.initState();
  }

  @override
  void dispose() {
    CoinApi().channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: CoinApi().channel.stream,
        builder: (context, snapshot) {
          debugPrint("test ${snapshot.data.toString()}");
          CoinRate currentRate;
          if (snapshot.data == null) {
            currentRate = CoinRate(
                asset_id_base: "",
                asset_id_quote: '',
                rate: 0,
                time: DateTime.now());
          } else {
            currentRate = snapshot.data as CoinRate;
          }
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
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text("Symbol:"),
                        Text(
                            "${currentRate.asset_id_base}/${currentRate.asset_id_quote}"),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Price:"),
                        Text("\$${currentRate.rate}"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Time:"),
                        Text(DateTimeFormat.format(currentRate.time,
                            format: 'M j, H:i')),
                      ],
                    )
                  ]),
            ),
          );
        });
  }
}
