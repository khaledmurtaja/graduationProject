class DonationOfferModel {
  late String fullName;
  late String bloodType;
  late String phoneNumber;
  late String location;
  late String weight;
  late String age;
  late String idNumber;

  DonationOfferModel({
    required this.fullName,
    required this.bloodType,
    required this.phoneNumber,
    required this.location,
    required this.weight,
    required this.age,
    required this.idNumber,
  });

  DonationOfferModel.fromJson(Map<dynamic, dynamic> json) {
    fullName = json['name'];
    bloodType = json['blood_type'];
    phoneNumber = json['phone_number'];
    location = json['location'];
  }

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['name'] = fullName;
    data['blood_type'] = bloodType;
    data['phone_number'] = phoneNumber;
    data['location'] = location;
    data['weight'] = weight;
    data['age'] = age;
    data['id_number'] = idNumber;
    return data;
  }
}
