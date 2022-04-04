import 'package:coin_api_test/models/coin_asset.dart';
import 'package:coin_api_test/services/coin_api.dart';
import 'package:get/get.dart';

class CoinAssetController extends GetxController {
  RxList<CoinAsset> assetsList = RxList<CoinAsset>([]);

  @override
  void onInit() {
    super.onInit();
    initialLoad();
  }

  initialLoad() async {
    assetsList.value = await CoinApi().getAllAssets();
  }
}
