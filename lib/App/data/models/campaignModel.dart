import '../../../core/values/apiEndPoints.dart';

class CampaignModel {
  int? id;
  String? imageUrl;

  CampaignModel({this.id, this.imageUrl});

  CampaignModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = ApiEndPoints.IMAGE_BASE_URL + json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
