import 'dart:convert';

class CoinRate {
  String asset_id_base;
  String asset_id_quote;
  DateTime time;
  double rate;
  CoinRate({
    required this.asset_id_base,
    required this.asset_id_quote,
    required this.time,
    required this.rate,
  });

  CoinRate copyWith({
    String? asset_id_base,
    String? asset_id_quote,
    DateTime? time,
    double? rate,
  }) {
    return CoinRate(
      asset_id_base: asset_id_base ?? this.asset_id_base,
      asset_id_quote: asset_id_quote ?? this.asset_id_quote,
      time: time ?? this.time,
      rate: rate ?? this.rate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'asset_id_base': asset_id_base,
      'asset_id_quote': asset_id_quote,
      'time': time.millisecondsSinceEpoch,
      'rate': rate,
    };
  }

  factory CoinRate.fromMap(Map<String, dynamic> map) {
    return CoinRate(
      asset_id_base: map['asset_id_base'] ?? '',
      asset_id_quote: map['asset_id_quote'] ?? '',
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      rate: map['rate']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinRate.fromJson(String source) =>
      CoinRate.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CoinRate(asset_id_base: $asset_id_base, asset_id_quote: $asset_id_quote, time: $time, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoinRate &&
        other.asset_id_base == asset_id_base &&
        other.asset_id_quote == asset_id_quote &&
        other.time == time &&
        other.rate == rate;
  }

  @override
  int get hashCode {
    return asset_id_base.hashCode ^
        asset_id_quote.hashCode ^
        time.hashCode ^
        rate.hashCode;
  }
}
