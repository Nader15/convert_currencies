import 'package:meta/meta.dart';
import 'dart:convert';

TwoCurrenciesConverterModel twoCurrenciesConverterModelFromJson(String str) => TwoCurrenciesConverterModel.fromJson(json.decode(str));

String twoCurrenciesConverterModelToJson(TwoCurrenciesConverterModel data) => json.encode(data.toJson());

class TwoCurrenciesConverterModel {
  Motd motd;
  bool success;
  Query query;
  Info info;
  bool historical;
  DateTime date;
  dynamic result;

  TwoCurrenciesConverterModel({
    required this.motd,
    required this.success,
    required this.query,
    required this.info,
    required this.historical,
    required this.date,
    required this.result,
  });

  factory TwoCurrenciesConverterModel.fromJson(Map<String, dynamic> json) => TwoCurrenciesConverterModel(
    motd: Motd.fromJson(json["motd"]),
    success: json["success"],
    query: Query.fromJson(json["query"]),
    info: Info.fromJson(json["info"]),
    historical: json["historical"],
    date: DateTime.parse(json["date"]),
    result: json["result"]==null?0.0:json["result"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "motd": motd.toJson(),
    "success": success,
    "query": query.toJson(),
    "info": info.toJson(),
    "historical": historical,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "result": result,
  };
}

class Info {
  dynamic rate;

  Info({
    required this.rate,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    rate: json["rate"]==null?0.0:json["rate"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
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

class Query {
  String from;
  String to;
  dynamic amount;

  Query({
    required this.from,
    required this.to,
    required this.amount,
  });

  factory Query.fromJson(Map<String, dynamic> json) => Query(
    from: json["from"],
    to: json["to"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "from": from,
    "to": to,
    "amount": amount,
  };
}
