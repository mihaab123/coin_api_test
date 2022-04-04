import 'dart:convert';

class CoinHystory {
  DateTime time_period_end;
  double rate_close;
  CoinHystory({
    required this.time_period_end,
    required this.rate_close,
  });

  CoinHystory copyWith({
    DateTime? time_period_end,
    double? rate_close,
  }) {
    return CoinHystory(
      time_period_end: time_period_end ?? this.time_period_end,
      rate_close: rate_close ?? this.rate_close,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'time_period_end': time_period_end.millisecondsSinceEpoch,
      'rate_close': rate_close,
    };
  }

  factory CoinHystory.fromMap(Map<String, dynamic> map) {
    return CoinHystory(
      time_period_end:
          DateTime.fromMillisecondsSinceEpoch(map['time_period_end']),
      rate_close: map['rate_close']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinHystory.fromJson(String source) =>
      CoinHystory.fromMap(json.decode(source));

  @override
  String toString() =>
      'CoinHystory(time_period_end: $time_period_end, rate_close: $rate_close)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoinHystory &&
        other.time_period_end == time_period_end &&
        other.rate_close == rate_close;
  }

  @override
  int get hashCode => time_period_end.hashCode ^ rate_close.hashCode;
}
