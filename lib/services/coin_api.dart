import 'package:coin_api_test/models/coin_asset.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CoinApi {
  String token = "4A1800B6-D40E-43BC-AAA9-D3808B07B2F4";
  String url = "https://rest.coinapi.io/";
  void getRequest(String body) async {
    var dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["X-CoinAPI-Key"] = token;
    final response = await dio.get(url);
    debugPrint(response.data);
  }

  Future<List<CoinAsset>> getAllAssets() async {
    List<CoinAsset> _assetsList = [];

    return _assetsList;
  }
}
