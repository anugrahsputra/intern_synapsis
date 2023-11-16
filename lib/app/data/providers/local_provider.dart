import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalProvider {
  String? getToken();
  String? getEmail();
  String? getPassword();
  Future<bool> setEmail(String email);
  Future<bool> setPassword(String password);
  Future<bool> setToken(String token);
  Future<bool> clear();
  Future<bool> isLoggedIn();
}

class LocalProviderImpl implements LocalProvider {
  final SharedPreferences sharedPreferences;

  LocalProviderImpl({required this.sharedPreferences});

  @override
  String? getToken() {
    return sharedPreferences.getString('token');
  }

  @override
  Future<bool> setToken(String token) async {
    return await sharedPreferences.setString('token', token);
  }

  @override
  Future<bool> clear() async {
    return await sharedPreferences.clear();
  }

  @override
  Future<bool> isLoggedIn() async {
    return getToken() != null;
  }

  @override
  String? getEmail() => sharedPreferences.getString('email');

  @override
  String? getPassword() => sharedPreferences.getString('password');

  @override
  Future<bool> setEmail(String email) async {
    return await sharedPreferences.setString('email', email);
  }

  @override
  Future<bool> setPassword(String password) async {
    return await sharedPreferences.setString('password', password);
  }
}
