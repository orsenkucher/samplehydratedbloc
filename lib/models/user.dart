import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final List<Address> address;
  const User({this.name, this.address});

  @override
  List<Object> get props => [name, address];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address?.map((x) => x.toJson())?.toList(),
    };
  }

  static User fromJson(Map<String, dynamic> map) {
    if (map == null) return null;
    final address =
        map['address'].map<Address>((x) => Address.fromJson(x)).toList();
    return User(
      name: map['name'],
      address: address,
      // ?.cast<Address>(),
    );
  }

  @override
  bool get stringify => true;
}

class Address extends Equatable {
  final String streetName;
  final String city;
  final int zipCode;
  const Address({this.streetName, this.city, this.zipCode});

  Map<String, dynamic> toJson() {
    // return <String, dynamic>{};
    return {
      'streetName': streetName,
      'city': city,
      'zipCode': zipCode,
    };
  }

  static Address fromJson(Map<String, dynamic> map) {
    // return Address();
    if (map == null) return null;

    return Address(
      streetName: map['streetName'],
      city: map['city'],
      zipCode: map['zipCode'],
    );
  }

  Address copyWith({
    String streetName,
    String city,
    int zipCode,
  }) {
    return Address(
      streetName: streetName ?? this.streetName,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
    );
  }

  @override
  List<Object> get props => [streetName, city, zipCode];
  @override
  bool get stringify => true;
}
