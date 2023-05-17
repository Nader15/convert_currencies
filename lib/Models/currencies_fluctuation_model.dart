import 'package:meta/meta.dart';
import 'dart:convert';

CurrenciesFluctuationModel currenciesFluctuationModelFromJson(String str) => CurrenciesFluctuationModel.fromJson(json.decode(str));

String currenciesFluctuationModelToJson(CurrenciesFluctuationModel data) => json.encode(data.toJson());

class CurrenciesFluctuationModel {
  Motd motd;
  bool success;
  bool fluctuation;
  DateTime startDate;
  DateTime endDate;
  Map<String, Rate> rates;

  CurrenciesFluctuationModel({
    required this.motd,
    required this.success,
    required this.fluctuation,
    required this.startDate,
    required this.endDate,
    required this.rates,
  });

  factory CurrenciesFluctuationModel.fromJson(Map<String, dynamic> json) {
    final ratesJson = json["rates"] as Map<String, dynamic>;
    final rates = <String, Rate>{};

    ratesJson.forEach((currency, rateJson) {
      rates[currency] = Rate.fromJson(currency, rateJson);
    });

    return CurrenciesFluctuationModel(
      motd: Motd.fromJson(json["motd"]),
      success: json["success"],
      fluctuation: json["fluctuation"],
      startDate: DateTime.parse(json["start_date"]),
      endDate: DateTime.parse(json["end_date"]),
      rates: rates,
    );
  }

  Map<String, dynamic> toJson() => {
    "motd": motd.toJson(),
    "success": success,
    "fluctuation": fluctuation,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Motd {
  String msg;
  String url;

  Motd({
    required this.msg,
    required this.url,
  });

  factory Motd.fromJson(Map<String, dynamic> json) => Motd(
    msg: json["msg"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "url": url,
  };
}

class Rate {
  String currency;
  double startRate;
  double endRate;
  double change;
  double changePct;

  Rate({
    required this.currency,
    required this.startRate,
    required this.endRate,
    required this.change,
    required this.changePct,
  });

  factory Rate.fromJson(String currency,Map<String, dynamic> json) => Rate(
    currency: currency,
    startRate: json["start_rate"].toDouble(),
    endRate: json["end_rate"].toDouble(),
    change: json["change"].toDouble(),
    changePct: json["change_pct"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "currency": currency,
    "start_rate": startRate,
    "end_rate": endRate,
    "change": change,
    "change_pct": changePct,
  };
}
