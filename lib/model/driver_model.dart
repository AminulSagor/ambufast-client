// Campaign grid card model
class Driver {
  final String name;
  final double rating;
  final double reviewCount;
  final String vehicleDetails;

  const Driver(this.name, this.rating, this.reviewCount, this.vehicleDetails);

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    json['name'] ?? '',
    json['rating'] ?? 0,
    json['reviewCount'] ?? 0,
    json['vehicleDetails'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'rating': rating,
    'reviewCount': reviewCount,
    'vehicleDetails': vehicleDetails,
  };
}
