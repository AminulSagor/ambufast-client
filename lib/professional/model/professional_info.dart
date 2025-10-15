class ProfessionalInfo {
  final String affiliationType; // e.g., Hospital, Clinic
  final String organisationName;
  final String role;
  final String zone; // city/area of operation

  final String? workIdPath; // uploaded file paths (mock)
  final String? nidFrontPath;
  final String? nidBackPath;

  const ProfessionalInfo({
    required this.affiliationType,
    required this.organisationName,
    required this.role,
    required this.zone,
    this.workIdPath,
    this.nidFrontPath,
    this.nidBackPath,
  });

  ProfessionalInfo copyWith({
    String? affiliationType,
    String? organisationName,
    String? role,
    String? zone,
    String? workIdPath,
    String? nidFrontPath,
    String? nidBackPath,
  }) {
    return ProfessionalInfo(
      affiliationType: affiliationType ?? this.affiliationType,
      organisationName: organisationName ?? this.organisationName,
      role: role ?? this.role,
      zone: zone ?? this.zone,
      workIdPath: workIdPath ?? this.workIdPath,
      nidFrontPath: nidFrontPath ?? this.nidFrontPath,
      nidBackPath: nidBackPath ?? this.nidBackPath,
    );
  }
}
