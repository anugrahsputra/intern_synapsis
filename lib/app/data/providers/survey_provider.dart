import 'package:dio/dio.dart';

import '../../core/core.dart';
import '../data.dart';

abstract class SurveyProvider {
  Future<List<SurveyModel>> getAllSurvey();
  Future<SurveyModel> getSurvey(String id);
}

class SurveyProviderImpl implements SurveyProvider {
  final Dio dio;

  SurveyProviderImpl({required this.dio});

  @override
  Future<List<SurveyModel>> getAllSurvey() async {
    final response = await dio.get(ApiPath.survey);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((item) => SurveyModel.fromJson(item)).toList();
    } else {
      throw const ServerFailure("SurveyProvider: failed to get all survey");
    }
  }

  @override
  Future<SurveyModel> getSurvey(String id) async {
    final response = await dio.get("${ApiPath.survey}/$id");
    if (response.statusCode == 200) {
      return SurveyModel.fromJson(response.data);
    } else {
      throw const ServerFailure("SurveyProvider: failed to get survey");
    }
  }
}
