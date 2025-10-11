class AdditionalServiceOption {
  final String id;
  final String name;
  final int price; // BDT
  const AdditionalServiceOption({
    required this.id,
    required this.name,
    required this.price,
  });
}

class VehicleService {
  final String id;
  final String title;
  final String subtitle;
  final List<AdditionalServiceOption> options;

  const VehicleService({
    required this.id,
    required this.title,
    required this.subtitle,
    this.options = const [],
  });
}
