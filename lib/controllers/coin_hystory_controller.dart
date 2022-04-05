import 'package:coin_api_test/models/coin_hystory.dart';
import 'package:coin_api_test/services/coin_api.dart';
import 'package:get/get.dart';

class CoinHystoryController extends GetxController {
  RxList<CoinHystory> hystoryList = RxList<CoinHystory>([]);
  RxString symbol = RxString("");

  @override
  void onInit() {
    super.onInit();
    initialLoad();
  }

  initialLoad() async {
    hystoryList.value = await CoinApi().getAllHystory("", "");
  }

  loadData(
    String asset_id_base,
    String asset_id_quote,
  ) async {
    symbol.value = "$asset_id_base/$asset_id_quote";
    hystoryList.value =
        await CoinApi().getAllHystory(asset_id_base, asset_id_quote);
  }

  getAllAssets() async {
    await CoinApi().getAllAssets();
  }
}
