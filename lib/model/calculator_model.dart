// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

MainCalculatorModel MainCalculatorFromJson(String str) => MainCalculatorModel.fromJson(json.decode(str));

String MainCalculatorToJson(MainCalculatorModel data) => json.encode(data.toJson());

class MainCalculatorModel {
    MainCalculatorModel({
        required this.status,
        this.tradingValume,
        this.tokenBalance,
        required this.tokenpriceInUsd,
        required this.data1,
        required this.data2,
    });

    bool status;
    dynamic tradingValume;
    dynamic tokenBalance;
    String tokenpriceInUsd;
    Data data1;
    Data data2;

    factory MainCalculatorModel.fromJson(Map<String, dynamic> json) => MainCalculatorModel(
        status: json["status"],
        tradingValume: json["tradingValume"],
        tokenBalance: json["tokenBalance"],
        tokenpriceInUsd: json["tokenpriceInUSD"],
        data1: Data.fromJson(json["data1"]),
        data2: Data.fromJson(json["data2"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "tradingValume": tradingValume,
        "tokenBalance": tokenBalance,
        "tokenpriceInUSD": tokenpriceInUsd,
        "data1": data1.toJson(),
        "data2": data2.toJson(),
    };
}

class Data {
    Data({
        required this.line1,
        required this.line2,
        required this.line3,
        required this.line4,
    });

    String line1;
    String line2;
    String line3;
    String line4;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        line1: json["line1"],
        line2: json["line2"],
        line3: json["line3"],
        line4: json["line4"],
    );

    Map<String, dynamic> toJson() => {
        "line1": line1,
        "line2": line2,
        "line3": line3,
        "line4": line4,
    };
}


