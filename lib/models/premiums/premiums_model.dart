class PremiumsResponse {
  final String code;
  final String message;
  final PremiumData data;

  PremiumsResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory PremiumsResponse.fromJson(Map<String, dynamic> json) {
    return PremiumsResponse(
      code: json['code'],
      message: json['message'],
      data: PremiumData.fromJson(json['data']),
    );
  }
}

class PremiumData {
  final SubscriptionPackages subscriptionPackages;

  PremiumData({required this.subscriptionPackages});

  factory PremiumData.fromJson(Map<String, dynamic> json) {
    return PremiumData(
      subscriptionPackages: SubscriptionPackages.fromJson(json['subscriptionPackages']),
    );
  }
}

class SubscriptionPackages {
  final List<PremiumsModel> items;
  final int pageIndex;
  final int pageSize;
  final int totalCount;
  final bool hasNextPage;
  final bool hasPreviousPage;

  SubscriptionPackages({
    required this.items,
    required this.pageIndex,
    required this.pageSize,
    required this.totalCount,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory SubscriptionPackages.fromJson(Map<String, dynamic> json) {
    return SubscriptionPackages(
      items: (json['items'] as List).map((e) => PremiumsModel.fromJson(e)).toList(),
      pageIndex: json['pageIndex'],
      pageSize: json['pageSize'],
      totalCount: json['totalCount'],
      hasNextPage: json['hasNextPage'],
      hasPreviousPage: json['hasPreviousPage'],
    );
  }
}

class PremiumsModel {
  final String id;
  final String name;
  final int price;
  final String? expiredDate;

  PremiumsModel({
    required this.id,
    required this.name,
    required this.price,
    this.expiredDate,
  });

  factory PremiumsModel.fromJson(Map<String, dynamic> json) {
    return PremiumsModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      expiredDate: json['expiredDate'],
    );
  }
}
