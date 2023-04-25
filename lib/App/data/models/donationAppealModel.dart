class DonationAppealModel {
  late String fullName;
  late String bloodType;
  late String phoneNumber;
  late String location;
  late String description;

  DonationAppealModel({
    required this.fullName,
    required this.bloodType,
    required this.phoneNumber,
    required this.location,
    required this.description,
  });

  DonationAppealModel.fromJson(Map<dynamic, dynamic> json) {
    fullName = json['name'];
    bloodType = json['blood_type'];
    phoneNumber = json['phone_number'];
    location = json['location'];
    description =json['description'] ;
  }

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['name'] = fullName;
    data['blood_type'] = bloodType;
    data['phone_number'] = phoneNumber;
    data['location'] = location;
    data['description'] = description;
    return data;
  }
}
