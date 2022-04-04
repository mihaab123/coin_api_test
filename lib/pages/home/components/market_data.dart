import 'package:coin_api_test/controllers/coin_hystory_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MarketData extends StatefulWidget {
  MarketData({
    Key? key,
  }) : super(key: key);

  @override
  State<MarketData> createState() => _MarketDataState();
}

class _MarketDataState extends State<MarketData> {
  final CoinHystoryController _coinHystoryController =
      Get.find<CoinHystoryController>();
  final channel = WebSocketChannel.connect(
    Uri.parse('wss://ws.coinapi.io/v1/'),
  );
  @override
  void initState() {
    channel.sink.add({
      "type": "hello",
      "apikey": "4A1800B6-D40E-43BC-AAA9-D3808B07B2F4",
      "heartbeat": false,
      "subscribe_data_type": ["exrate"],
      "subscribe_filter_asset_id": ["BTC/USD"]
    });
    super.initState();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          debugPrint("test ${snapshot.data.toString()}");
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
                        Obx(() {
                          return Text(_coinHystoryController.symbol.value);
                        }),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Price:"),
                        //Text(snapshot.data![""]),
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
        });
  }
}
