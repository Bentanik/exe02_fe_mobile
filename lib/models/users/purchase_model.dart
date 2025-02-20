class PaymentResponse {
  final Value value;
  final bool isSuccess;
  final bool isFailure;
  final Error error;

  PaymentResponse({
    required this.value,
    required this.isSuccess,
    required this.isFailure,
    required this.error,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) {
    return PaymentResponse(
      value: Value.fromJson(json['value']),
      isSuccess: json['isSuccess'],
      isFailure: json['isFailure'],
      error: Error.fromJson(json['error']),
    );
  }
}

class Value {
  final String code;
  final String message;
  final Data data;

  Value({
    required this.code,
    required this.message,
    required this.data,
  });

  factory Value.fromJson(Map<String, dynamic> json) {
    return Value(
      code: json['code'] ?? '',
      message: json['message'] ?? '',
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final bool success;
  final String paymentUrl;
  final String message;

  Data({
    required this.success,
    required this.paymentUrl,
    required this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      success: json['success'],
      paymentUrl: json['paymentUrl'],
      message: json['message'],
    );
  }
}

class Error {
  final String code;
  final String message;

  Error({
    required this.code,
    required this.message,
  });

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
      code: json['code'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
