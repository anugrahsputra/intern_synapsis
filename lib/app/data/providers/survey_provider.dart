import 'package:dio/dio.dart';

import '../../core/core.dart';
import '../data.dart';

abstract class SurveyProvider {
  Future<List<SurveyModel>> getAllSurvey();
  Future<SurveyModel> getSurvey(String id);
}

class SurveyProviderImpl implements SurveyProvider {
  final Dio dio;
  final LocalProvider localProvider;

  SurveyProviderImpl({
    required this.dio,
    required this.localProvider,
  });

  @override
  Future<List<SurveyModel>> getAllSurvey() async {
    final token = localProvider.getToken();
    final response = await dio.get(ApiPath.survey,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Cookie': 'token=$token',
          },
        ));
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'];
      return data.map((item) => SurveyModel.fromJson(item)).toList();
    } else {
      throw const ServerFailure("SurveyProvider: failed to get all survey");
    }
  }

  @override
  Future<SurveyModel> getSurvey(String id) async {
    final token = localProvider.getToken();
    final response = await dio.get("${ApiPath.survey}/$id",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Cookie': 'token=$token',
          },
        ));
    if (response.statusCode == 200) {
      return SurveyModel.fromJson(response.data['data']);
    } else {
      throw const ServerFailure("SurveyProvider: failed to get survey");
    }
  }
}
