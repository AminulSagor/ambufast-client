// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SavedAddress {
  final String id;
  final String title;
  final String? addressTitle;
  final String? address;

  const SavedAddress({
    required this.id,
    required this.title,
    this.addressTitle,
    this.address,
  });

  SavedAddress copyWith({
    String? id,
    String? title,
    String? addressTitle,
    String? address,
  }) {
    return SavedAddress(
      id: id ?? this.id,
      title: title ?? this.title,
      addressTitle: addressTitle ?? this.addressTitle,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'addressTitle': addressTitle,
      'address': address,
    };
  }

  factory SavedAddress.fromMap(Map<String, dynamic> map) {
    return SavedAddress(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      addressTitle: map['addressTitle'] != null
          ? map['addressTitle'] as String
          : null,
      address: map['address'] != null ? map['address'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SavedAddress.fromJson(String source) =>
      SavedAddress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(id: $id, title: $title, addressTitle: $addressTitle, address: $address)';
  }

  @override
  bool operator ==(covariant SavedAddress other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.addressTitle == addressTitle &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        addressTitle.hashCode ^
        address.hashCode;
  }
}
