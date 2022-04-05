import 'dart:convert';

import 'package:coin_api_test/models/coin_asset.dart';
import 'package:coin_api_test/models/coin_hystory.dart';
import 'package:coin_api_test/services/date_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:web_socket_channel/io.dart';

class CoinApi {
  String token = "4A1800B6-D40E-43BC-AAA9-D3808B07B2F4";
  String url = "https://rest.coinapi.io/";
  final channel = IOWebSocketChannel.connect(
    Uri.parse('wss://ws-sandbox.coinapi.io/v1/'),
  );
  Future<Response> getRequest(String body) async {
    var dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(onError: (e, handler) {
      debugPrint(e.message);
      handler.next(e);
    }, onRequest: (r, handler) {
      debugPrint(r.method);
      debugPrint(r.path);
      handler.next(r);
    }, onResponse: (r, handler) {
      debugPrint(r.data.toString());
      handler.next(r);
    }));
    //dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers.clear();
    dio.options.headers["X-CoinAPI-Key"] = token;
    debugPrint(dio.options.headers.toString());
    var response = await dio.get(url + body);
    debugPrint(response.statusCode.toString());
    dio.close();
    return response;
  }

  Future<List<CoinAsset>> getAllAssets() async {
    List<CoinAsset> _assetsList = [];
    var response = await getRequest("v1/assets/BTC");
    /* _assetsList = json
        .decode(response.data)
        .map((data) => CoinAsset.fromJson(data))
        .toList();*/
    return _assetsList;
  }

  Future<List<CoinHystory>> getAllHystory(
    String asset_id_base,
    String asset_id_quote,
  ) async {
    DateTime _currentDate = DateTime.now();
    String startTime =
        DataService().DateToString(_currentDate.add(const Duration(days: -3)));
    String endTime = DataService().DateToString(_currentDate);
    List<CoinHystory> _hystoryList = [];
    if (asset_id_base.isNotEmpty && asset_id_quote.isNotEmpty) {
      Response<dynamic> response = await getRequest(
          "v1/exchangerate/$asset_id_base/$asset_id_quote/history?period_id=1DAY&time_start=$startTime&time_end=$endTime");
      debugPrint((response.data as List).length.toString());
      for (var pair in (response.data as List)) {
        _hystoryList.add(CoinHystory(
            rate_close: pair["rate_close"],
            time_period_end:
                DataService().StringToDate(pair["time_period_end"])));
      }
    }
    debugPrint("_hystoryList = ${_hystoryList.toString()}");
    final json = jsonEncode({
      "type": "hello",
      "apikey": token,
      "heartbeat": false,
      "subscribe_data_type": ["exrate"],
      "subscribe_filter_asset_id": ["$asset_id_base/$asset_id_quote"]
    });
    debugPrint(json);
    channel.sink.add(jsonEncode(json));
    return _hystoryList;
  }
}
