class Address {
  final String id;
  final String state;
  final String city;
  final String street;
  final String apartment;
  final String phoneNumber;
  final String notes;

  Address({
    required this.id,
    required this.state,
    required this.city,
    required this.street,
    required this.apartment,
    required this.phoneNumber,
    required this.notes,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      state: json['state'],
      city: json['city'],
      street: json['street'],
      apartment: json['apartment'],
      phoneNumber: json['phoneNumber'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "state": state,
      "city": city,
      "street": street,
      "apartment": apartment,
      "phoneNumber": phoneNumber,
      "notes": notes,
    };
  }

  String get fullAddress => '$street, $apartment - $city, $state';
}

final List<Address> dummmyAddresses = [
  Address(
    id: "",
    state: 'gharbia',
    city: 'samannoud',
    street: 'market street',
    apartment: 'infront of mosque',
    phoneNumber: '01012312312',
    notes: '',
  ),
];
