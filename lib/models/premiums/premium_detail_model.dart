class PremiumResponse {
  final String code;
  final String message;
  final PremiumData data;

  PremiumResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory PremiumResponse.fromJson(Map<String, dynamic> json) {
    return PremiumResponse(
      code: json['code'],
      message: json['message'],
      data: PremiumData.fromJson(json['data']),
    );
  }
}

class PremiumData {
  final PremiumDetailModel subscriptionPackage;

  PremiumData({required this.subscriptionPackage});

  factory PremiumData.fromJson(Map<String, dynamic> json) {
    return PremiumData(
      subscriptionPackage: PremiumDetailModel.fromJson(json['subscriptionPackage']),
    );
  }
}

class PremiumDetailModel {
  final String id;
  final String name;
  final int price;
  final String? expiredDate;

  PremiumDetailModel({
    required this.id,
    required this.name,
    required this.price,
    this.expiredDate,
  });

  factory PremiumDetailModel.fromJson(Map<String, dynamic> json) {
    return PremiumDetailModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      expiredDate: json['expiredDate'],
    );
  }
}
