import 'package:blood4life/core/errors/exceptions.dart';
import '../../../core/values/apiEndPoints.dart';
import 'package:dio/src/response.dart' as api;
import 'package:get/get.dart';
import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/strings.dart';
import '../../data/services/apiService.dart';
import '../../data/services/sharedPrefService.dart';

class ProfileRepository {
  final apiService = Get.find<ApiService>();
  final sharedPref = Get.find<AppSharedPref>();
  Future<Object?> logout() async {
    if (await isConnectedToNetwork()) {
      try {
        final response = await _restApiLogout();
        return response;
      } on Exception catch (exception) {
        if (exception is UnAuthorizedException) {
          showSnackBar(message:"انتهت صلاحية الجلسة");
        } else if (exception is ServerException) {
          showSnackBar(message:"حدث خطأ اثناء الاتصال بالخادم");
        } else {
          showSnackBar(message:"حدث خطأ غير معروف");
        }
      }
      return null;
    } else {
      return _offlineLogOut();
    }
  }

  Future<api.Response?> _restApiLogout() async {
    String? token = sharedPref.getStringValue(key: "token");
    final response = await apiService.delete(
      url: ApiEndPoints.BASE_URL + ApiEndPoints.LOGUT,
      token: token!,
    );
    await sharedPref.removeValue(key: "token");
    await sharedPref.putBoolValue(key:loginPageKey , value: false);
    return response;
  }

  Future<bool> _offlineLogOut() async {
    bool value = await sharedPref.removeValue(key: "token");
    await sharedPref.putBoolValue(key:loginPageKey , value: false);
    return value;
  }
}
