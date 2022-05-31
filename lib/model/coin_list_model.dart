// ignore_for_file: prefer_collection_literals

class CoinListModel {
  String? symbol;
  String? name;
  String? address;

  CoinListModel({this.symbol, this.name, this.address});

  CoinListModel.fromJson(Map json) {
    symbol = json['symbol'];
    name = json['name'];
    address = json['address'] ?? "Rajkumar";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   Map<String, dynamic>();
    data['symbol'] = symbol;
    data['name'] = name;
    data['address'] = address;
    return data;
  }
}
