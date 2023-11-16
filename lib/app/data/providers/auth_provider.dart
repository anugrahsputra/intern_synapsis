import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/core.dart';
import '../data.dart';

abstract class AuthProvider {
  Future<UserModel> login(String email, String password);
  Future<void> logout();
}

class AuthProviderImpl implements AuthProvider {
  final Dio dio;
  final LocalProvider localProvider;

  AuthProviderImpl({
    required this.dio,
    required this.localProvider,
  });

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await dio.post(
      ApiPath.login,
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final token =
          response.headers['set-cookie']?[0].split(';')[0].split('=')[1];
      log(token.toString());
      if (token != null) await localProvider.setToken(token);
      return UserModel.fromJson(response.data["data"]);
    } else {
      throw const ServerFailure("AuthProvider: failed to login");
    }
  }

  @override
  Future<void> logout() async {
    final response = await dio.post(
      ApiPath.logout,
    );

    if (response.statusCode == 200) {
      await localProvider.clear();
    } else {
      throw const ServerFailure("AuthProvider: failed to logout");
    }
  }
}
