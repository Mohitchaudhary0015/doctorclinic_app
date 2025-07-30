class Doctor {
  final String uid;
  final String category;
  final String city;
  final String email;
  final String firstName;
  final String lastName;
  final String profileImageUrl;
  final String qualification;
  final String phoneNumber;
  final String yearsOfExperience;
  final double latitude;
  final double longitude;
  final int numberOfReviews;
  final int totalReviews;

  Doctor({
    required this.uid,
    required this.category,
    required this.city,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profileImageUrl,
    required this.qualification,
    required this.phoneNumber,
    required this.yearsOfExperience,
    required this.latitude,
    required this.longitude,
    required this.numberOfReviews,
    required this.totalReviews,
  });

  factory Doctor.fromMap(Map<dynamic, dynamic> map, String uid) {
    return Doctor(
      uid: uid,
      category: map['category']?.toString() ?? '',
      city: map['city']?.toString() ?? '',
      email: map['email']?.toString() ?? '',
      firstName: map['firstName']?.toString() ?? '',
      lastName: map['lastName']?.toString() ?? '',
      profileImageUrl: map['profileImageUrl']?.toString() ?? '',
      qualification: map['qualification']?.toString() ?? '',
      phoneNumber: map['phoneNumber']?.toString() ?? '',
      yearsOfExperience: map['yearsOfExperience']?.toString() ?? '',
      latitude: map['latitude'] != null ? double.tryParse(map['latitude'].toString()) ?? 0.0 : 0.0,
      longitude: map['longitude'] != null ? double.tryParse(map['longitude'].toString()) ?? 0.0 : 0.0,
      numberOfReviews: map['numberOfReviews'] != null ? int.tryParse(map['numberOfReviews'].toString()) ?? 0 : 0,
      totalReviews: map['totalReviews'] != null ? int.tryParse(map['totalReviews'].toString()) ?? 0 : 0,
    );
  }
}
