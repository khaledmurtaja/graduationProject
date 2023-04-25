import 'package:dio/src/response.dart'as api;
import 'package:get/get.dart';
import '../../../core/errors/exceptions.dart';
import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/apiEndPoints.dart';
import '../../data/models/userModel.dart';
import '../../data/services/apiService.dart';
import 'controller.dart';

class LoginRepository {
  ///api data source
  final apiService = Get.find<ApiService>();
  final controller=Get.find<LoginScreenController>();
  /// this function could handle more than one login method
  /// we use directly in the controller, the controller do not know anything about the implementation
  Future<api.Response?> login() async {
      try {
        final response = await _restApiLogIn();
        return response;
      }on Exception catch(exception){
        if(exception is UnAuthorizedException){
          showSnackBar(message:"خطأ في اسم المستخدم او كلمة المرور");
        }else{
          showSnackBar(message:"حدث خطأ غير متوقع, اعد المحاولة لاحقا");
        }
      }
    return null;
  }
  Future<api.Response?> _restApiLogIn() async {
    final response = await apiService.postRequest(
        url: ApiEndPoints.BASE_URL + ApiEndPoints.LOGIN,
        data: User(
          email: controller.emailController.text,
          password: controller.passwordController.text,
          deviceName: "dummy",
        ).toJson());
    return response;
  }

}
