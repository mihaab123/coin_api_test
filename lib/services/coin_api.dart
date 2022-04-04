import 'dart:convert';

import 'package:coin_api_test/models/coin_asset.dart';
import 'package:coin_api_test/models/coin_hystory.dart';
import 'package:coin_api_test/services/date_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CoinApi {
  String token = "4A1800B6-D40E-43BC-AAA9-D3808B07B2F4";
  String url = "https://rest.coinapi.io/";
  Future<Response> getRequest(String body) async {
    var dio = Dio(
      BaseOptions(
        baseUrl: url,
        receiveDataWhenStatusError: true,
      ),
    );
    dio.interceptors.add(InterceptorsWrapper(onError: (e, handler) {
      debugPrint(e.message);
      handler.next(e);
    }, onRequest: (r, handler) {
      debugPrint(r.method);
      debugPrint(r.path);
      handler.next(r);
    }, onResponse: (r, handler) {
      debugPrint(r.data);
      handler.next(r);
    }));
    //dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["X-CoinAPI-Key"] = token;
    return await dio.get(body);
  }

  Future<List<CoinAsset>> getAllAssets() async {
    List<CoinAsset> _assetsList = [];
    var response = await getRequest("String body");
    _assetsList = json
        .decode(response.data)
        .map((data) => CoinAsset.fromJson(data))
        .toList();
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
      var response = await getRequest(
          "/v1/exchangerate/$asset_id_base/$asset_id_quote/history?period_id=1DAY&time_start=$startTime&time_end=$endTime");
      debugPrint(response.toString());
      _hystoryList = json
          .decode(response.data)
          .map((data) => CoinHystory.fromJson(data))
          .toList();
    }
    debugPrint(_hystoryList.toString());
    return _hystoryList;
  }
}
