class OrderModel {
  final String orderId;
  final String orderCode;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String status;
  final num totalPrice;
  final String paymentMethod;

  OrderModel({
    required this.orderId,
    required this.orderCode,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.totalPrice,
    required this.paymentMethod,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'],
      orderCode: json['orderCode'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      status: json['status'],
      totalPrice: json['totalPrice'],
      paymentMethod: json['paymentMethod'],
    );
  }

  factory OrderModel.getFakeOrder() {
    return OrderModel(
      orderId: "av",
      orderCode: "aksnmvkads",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      status: "askvmadsk",
      totalPrice: 30,
      paymentMethod: "paymob",
    );
  }
}
