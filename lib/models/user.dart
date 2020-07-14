import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

class User extends Equatable {
  final String name;
  final List<Address> address;
  final Tree tree;
  const User({this.name, this.address, this.tree});

  @override
  List<Object> get props => [name, address, tree];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'tree': tree.toJson(),
      'address': address?.map((x) => x.toJson())?.toList(),
    };
  }

  static User fromJson(Map<String, dynamic> map) {
    if (map == null) return null;
    return User(
      name: map['name'],
      tree: Tree.fromJson(map['tree'] ?? {}),
      address: map['address'].map<Address>((x) => Address.fromJson(x)).toList(),
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

@freezed
abstract class Question with _$Question {
  const factory Question({
    int id,
    String question,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

@freezed
abstract class Tree with _$Tree {
  const factory Tree({
    Question question,
    Tree left,
    Tree right,
  }) = _QTree;

  factory Tree.fromJson(Map<String, dynamic> json) => _$TreeFromJson(json);
}
