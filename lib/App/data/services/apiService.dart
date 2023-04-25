import 'package:dio/dio.dart' as api;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../core/errors/exceptions.dart';
import '../../../core/utils/helperFunctions.dart';
import '../../../core/values/statusCodes.dart';

class ApiService extends GetxService {
  late api.Dio _dio;

  ///options to be sent along with the request.
  Map<String, String> headers = {
    "Content-Type": "application/json",
    'Accept': 'application/json'
  };

  /// initialize the Dio api object.
  Future<ApiService> init() async {
    _dio = api.Dio();
    return this;
  }

  ///post request.
  Future<api.Response?> postRequest(
      {required String url,
      required Map<String, String?> data,
      Map<String, String>? additionalHeaders,
      String? pathParameter}) async {
    try {
      if (additionalHeaders != null) {
        ///adding headers the request if its given(optional)
        headers.addAll(additionalHeaders);
      }
      if (pathParameter != null) {
        ///adding path parameter to the url just in case its not null(optional)
        url = '$url/$pathParameter';
      }
      api.Response response = await _dio.post(url,
          data: data, options: api.Options(headers: headers));
      if (response.statusCode == HttpStatus.created ||
          response.statusCode == HttpStatus.ok) {
        return response;
      }
    } on api.DioError catch (error) {
      if (error.response != null) {
        var statusCode = error.response!.statusCode;
        if (statusCode == HttpStatus.unauthorized) {
          throw UnAuthorizedException();
        } else if (statusCode == HttpStatus.serverError) {
          throw ServerException();
        } else if (statusCode == HttpStatus.unProcessable) {
          throw UnProcessableException();
        } else if (statusCode == HttpStatus.limiting) {
          throw TooManyRequestsException();
        } else if (statusCode == HttpStatus.conflict) {
          throw ConflictException();
        } else {
          throw UnKnownException();
        }
      } else {
        handleDioError(error: error);
      }
      if (kDebugMode) {
        print(error);
      }
    } catch (error) {
      throw UnKnownException();
    }
    return null;
  }

  ///getRequest
  Future<api.Response?> getRequest(
      {required String url,
      Map<String, String>? additionalHeaders,
      String? pathParameter}) async {
    try {
      if (additionalHeaders != null) {
        ///adding headers the request if its given(optional)
        headers.addAll(additionalHeaders);
      }
      if (pathParameter != null) {
        ///adding path parameter to the url just in case its not null(optional)
        url = '$url/$pathParameter';
      }
      api.Response response =
          await _dio.get(url, options: api.Options(headers: headers));
      if (response.statusCode == HttpStatus.ok) {
        return response;
      }
    } on api.DioError catch (error) {
      if (error.response != null) {
        var statusCode = error.response!.statusCode;
        if (statusCode == HttpStatus.unauthorized) {
          throw UnAuthorizedException();
        } else if (statusCode == HttpStatus.serverError) {
          throw ServerException();
        } else {
          throw UnKnownException();
        }
      } else {
        handleDioError(error: error);
      }
      if (kDebugMode) {
        print(error);
      }
    } catch (error) {
      throw UnKnownException();
    }
    return null;
  }

  ///delete request
  Future<api.Response?> delete(
      {required String url, required String token}) async {
    try {
      headers['Authorization'] = "Bearer $token";
      api.Response response =
          await _dio.delete(url, options: api.Options(headers: headers));
      if (response.statusCode == HttpStatus.created ||
          response.statusCode == HttpStatus.ok) {
        return response;
      }
    } on api.DioError catch (error) {
      if (error.response != null) {
        var statusCode = error.response!.statusCode;
        if (statusCode == HttpStatus.unauthorized) {
          throw UnAuthorizedException();
        } else if (statusCode == HttpStatus.serverError) {
          throw ServerException();
        } else {
          throw UnKnownException();
        }
      } else {
        handleDioError(error: error);
      }
    } catch (error) {
      throw UnKnownException();
    }
    return null;
  }
}
