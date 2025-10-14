import 'dart:convert';

class DriverInfo {
  final String name;
  final double rating;
  final double ratingCount;
  final String vehicleDetails;
  final String phone;

  const DriverInfo({
    required this.name,
    required this.rating,
    required this.ratingCount,
    required this.vehicleDetails,
    required this.phone,
  });

  DriverInfo copyWith({
    String? name,
    double? rating,
    double? ratingCount,
    String? vehicleDetails,
    String? phone,
  }) {
    return DriverInfo(
      name: name ?? this.name,
      rating: rating ?? this.rating,
      ratingCount: ratingCount ?? this.ratingCount,
      vehicleDetails: vehicleDetails ?? this.vehicleDetails,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'rating': rating,
      'ratingCount': ratingCount,
      'vehicleDetails': vehicleDetails,
      'phone': phone,
    };
  }

  factory DriverInfo.fromMap(Map<String, dynamic> map) {
    return DriverInfo(
      name: map['name'] ?? '',
      rating: map['rating'] ?? 0,
      ratingCount: map['ratingCount'] ?? 0,
      vehicleDetails: map['vehicleDetails'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverInfo.fromJson(String source) =>
      DriverInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Driver(name: $name, rating: $rating, ratingCount: $ratingCount, vehicleDetails: $vehicleDetails, phone: $phone)';
  }

  @override
  bool operator ==(covariant DriverInfo other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.rating == rating &&
        other.ratingCount == ratingCount &&
        other.vehicleDetails == vehicleDetails &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        rating.hashCode ^
        ratingCount.hashCode ^
        vehicleDetails.hashCode ^
        phone.hashCode;
  }
}
