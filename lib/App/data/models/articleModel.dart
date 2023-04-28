import '../../../core/values/apiEndPoints.dart';

class ArticleModel {
  int? id;
  String? title;
  String? url;
  String? description;
  String? imageUrl;

  ArticleModel({
    this.id,
    this.title,
    this.url,
    this.description,
    this.imageUrl,
  });

  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    description = json['description'];
    imageUrl = ApiEndPoints.IMAGE_BASE_URL + json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;

    return data;
  }
}
