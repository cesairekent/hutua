import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_fire_starter/src/core/api_routes.dart';
import 'package:flutter_fire_starter/src/core/interceptors/api_exception.dart';
import 'package:flutter_fire_starter/src/core/interceptors/interceptor.dart';
import 'package:flutter_fire_starter/src/models/api/api_response_model.dart';
import 'package:flutter_fire_starter/src/models/request/login_user_request_model.dart';
import 'package:flutter_fire_starter/src/models/request/register_user_request_model.dart';

class UserService {
  final Dio _dio = Dio()..interceptors.add(AppInterceptors());
  final ApiException exception = const ApiException();

  Future<ApiResponse> register(RegisterUserRequestModel request) async {
    try {
      final response = await _dio.post(
        ApiRoutes.register,
        data: request.toJson(),
      );

      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created) {
        var data = response.data;
        final result = exception.dataToApiResponse(data);

        if (result.data != null) {
          return result;
        }
      }
      return response.data;
    } on DioError catch (e) {
      var result = exception.dataToApiResponse(e.response?.data);
      return result;
    } on SocketException catch (err) {
      throw exception.showException(err.message);
    } on Exception catch (err) {
      throw exception.showException(err.toString());
    }
  }

  Future<ApiResponse> login(LoginUserRequestModel request) async {
    try {
      final response = await _dio.post(ApiRoutes.login, data: request.toJson());
      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created) {
        var data = response.data;
        final result = exception.dataToApiResponse(data);

        if (result.data != null) {
          return result;
        }
      }
      return response.data;
    } on DioError catch (e) {
      if (e.response?.statusCode == HttpStatus.internalServerError ||
          e.response?.statusCode == HttpStatus.notImplemented ||
          e.response?.statusCode == HttpStatus.badGateway ||
          e.response?.statusCode == HttpStatus.serviceUnavailable ||
          e.response?.statusCode == HttpStatus.gatewayTimeout) {
        throw exception.showException("Server Error");
      } else {
        var result = exception.dataToApiResponse(e.response?.data);
        return result;
      }
    } on SocketException catch (err) {
      throw exception.showException(err.message);
    } on Exception catch (err) {
      throw exception.showException(err.toString());
    }
  }

  // Future<String> deleteUser(int userId) async
  // {
  //   try {
  //     final response = await _dio.delete(
  //       '${ApiRoutes.user}/id/$userId',
  //     );

  //     if (response.statusCode == HttpStatus.noContent) {
  //       return Utils.successKey;
  //     }
  //     return response.data;
  //   } on DioError catch (e) {
  //     var result = exception.dataToApiResponse(e.response?.data);
  //     return result.errors!.first.message.replaceFirst(RegExp('_'), '.');
  //   } on SocketException catch (err) {
  //     throw exception.showException(err.message);
  //   } on Exception catch (err) {
  //     throw exception.showException(err.toString());
  //   }
  // }
}
