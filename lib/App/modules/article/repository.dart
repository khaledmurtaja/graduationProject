import 'package:blood4life/core/values/apiEndPoints.dart';
import 'package:get/get.dart';
import '../../data/models/articleModel.dart';
import '../../data/models/donationAppealModel.dart';
import '../../data/services/apiService.dart';

class BlogRepository {
  final apiService = Get.find<ApiService>();

  Future<List<ArticleModel>> getArticles({required int pageKey}) async {
    final response = await apiService.getRequest(
        url: ApiEndPoints.BASE_URL + ApiEndPoints.ARTICLS,
        pathParameter: "?page=$pageKey");
    final List<dynamic> jsonList = response?.data['data'];
    
    final List<ArticleModel> articles =
        jsonList.map((json) => ArticleModel.fromJson(json)).toList();
        
    return articles;
  }
}
