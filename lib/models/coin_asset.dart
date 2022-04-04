import 'dart:convert';

class CoinAsset {
  String asset_id;
  String name;
  double price_usd;
  DateTime data_trade_start;
  CoinAsset({
    required this.asset_id,
    required this.name,
    required this.price_usd,
    required this.data_trade_start,
  });

  CoinAsset copyWith({
    String? asset_id,
    String? name,
    double? price_usd,
    DateTime? data_trade_start,
  }) {
    return CoinAsset(
      asset_id: asset_id ?? this.asset_id,
      name: name ?? this.name,
      price_usd: price_usd ?? this.price_usd,
      data_trade_start: data_trade_start ?? this.data_trade_start,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'asset_id': asset_id,
      'name': name,
      'price_usd': price_usd,
      'data_trade_start': data_trade_start.millisecondsSinceEpoch,
    };
  }

  factory CoinAsset.fromMap(Map<String, dynamic> map) {
    return CoinAsset(
      asset_id: map['asset_id'] ?? '',
      name: map['name'] ?? '',
      price_usd: map['price_usd']?.toDouble() ?? 0.0,
      data_trade_start:
          DateTime.fromMillisecondsSinceEpoch(map['data_trade_start']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinAsset.fromJson(String source) =>
      CoinAsset.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CoinAsset(asset_id: $asset_id, name: $name, price_usd: $price_usd, data_trade_start: $data_trade_start)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoinAsset &&
        other.asset_id == asset_id &&
        other.name == name &&
        other.price_usd == price_usd &&
        other.data_trade_start == data_trade_start;
  }

  @override
  int get hashCode {
    return asset_id.hashCode ^
        name.hashCode ^
        price_usd.hashCode ^
        data_trade_start.hashCode;
  }
}
