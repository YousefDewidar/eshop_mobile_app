class CartProductModel {
  final String itemId;
  final String productId;
  final String productName;
  final String productCoverUrl;
  final num productStock;
  final num weightInGrams;
  final num pricePerUnit;
  final int quantity;
  final num totalPriceForItem;

  CartProductModel({
    required this.itemId,
    required this.productId,
    required this.productName,
    required this.productCoverUrl,
    required this.productStock,
    required this.weightInGrams,
    required this.pricePerUnit,
    required this.quantity,
    required this.totalPriceForItem,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      itemId: json['itemId'],
      productId: json['productId'],
      productName: json['productName'],
      productCoverUrl: json['productCoverUrl'],
      productStock: json['productStock'],
      weightInGrams: (json['weightInGrams']),
      pricePerUnit: (json['pricePerUnit']),
      quantity: json['quantity'],
      totalPriceForItem: (json['totalPrice']),
    );
  }
}
