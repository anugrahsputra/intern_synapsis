import 'package:dio/dio.dart';

import '../../core/core.dart';
import '../data.dart';

abstract class AuthProvider {
  Future<UserModel> login(String email, String password);
}

class AuthProviderImpl implements AuthProvider {
  final Dio dio;

  AuthProviderImpl({required this.dio});

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await dio.post(ApiPath.login, data: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data["data"]);
    } else {
      throw const ServerFailure("AuthProvider: failed to login");
    }
  }
}
