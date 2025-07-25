// ignore_for_file: constant_identifier_names

enum CardType { OmanNet, JCB, Meeza, Maestro, Amex, Visa, MasterCard }

class SavedBankCard {
  final String token;

  final String maskedPanNumber;

  final String cardType;

  SavedBankCard({
    required this.token,
    required this.maskedPanNumber,
    required this.cardType,
  });

  // Convert the custom CardType class to a Map (which can be serialized to JSON)
  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'maskedPanNumber': maskedPanNumber,
      'cardType': cardType,
    };
  }
}
