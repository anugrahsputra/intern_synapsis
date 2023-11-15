import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalProvider {
  String? getToken();
  Future<bool> setToken(String token);
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
    return sharedPreferences.setString('token', token);
  }
}
