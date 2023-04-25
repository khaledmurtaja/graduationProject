import 'package:blood4life/App/modules/register/controller.dart';
import 'package:dio/src/response.dart'as api;
import 'package:get/get.dart';
import '../../../core/errors/exceptions.dart';
import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/apiEndPoints.dart';
import '../../data/models/userModel.dart';
import '../../data/services/apiService.dart';

///Here our repositories are just classes that will mediate the communication between our controller and our data

class RegisterRepository{
  ///api data source
  final apiService = Get.find<ApiService>();
  final controller=Get.find<RegisterScreenController>();
  Future<api.Response?> register() async {
    /// inside this function we should make conditions to decide which register method we will use
    /// but for now we just have 1 method.
    try {
      final response = await _restApiRegister();
      return response;
    }on Exception catch(exception){
      if(exception is UnProcessableException){
        showSnackBar(message:"البريد الالكتروني موجود مسبقا");
      }
     else{
        showSnackBar(message:"حدث خطأ غير متوقع, اعد المحاولة لاحقا");
      }
    }
    return null;
  }
  Future<api.Response?> _restApiRegister() async {
    final response = await apiService.postRequest(
        url: ApiEndPoints.BASE_URL + ApiEndPoints.REGISTER,
        data: User(
            name: controller.nameController.text,
            email: controller.emailController.text,
            password: controller.passwordController.text,
            deviceName: "dummy",
            passwordConfirmation: controller.passwordConfirmController.text)
            .toJson());
    return response;
  }
 /// we could add more register methods and manage them in the register function
/// example:googleRegister,faceBookRegister
}