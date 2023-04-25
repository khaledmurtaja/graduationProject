class DonationOfferModel {
   String fullName;
  String bloodType;
  String phoneNumber;
  String location;
  String weight;
  String age;
  String idNumber;

  DonationOfferModel({
    required this.fullName,
    required this.bloodType,
    required this.phoneNumber,
    required this.location,
    required this.weight,
    required this.age,
    required this.idNumber,
  });

  factory DonationOfferModel.fromJson(Map<String, String> json) {
    return DonationOfferModel(
      fullName: json['name']!,
      bloodType: json['blood_type']!,
      phoneNumber: json['phone_number']!,
      location: json['location']!,
      weight: json['weight']!,
      age: json['age']!,
      idNumber: json['id_number']!,
    );
  }

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['name']=fullName;
    data['blood_type'] = bloodType;
    data['phone_number'] = phoneNumber;
    data['location'] = location;
    data['weight'] = weight;
    data['age'] = age;
    data['id_number'] = idNumber;
    return data;
  }
}
