import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intern_synapsis/app/core/core.dart';
import 'package:intern_synapsis/app/data/data.dart';
import 'package:mockito/mockito.dart';

import '../../helper/mock.dart';

void main() {
  late MockDio dio;
  late SurveyProvider surveyProvider;

  setUp(() {
    dio = MockDio();
    surveyProvider = SurveyProviderImpl(dio: dio);
  });

  group("getAllSurveys()", () {
    test("should returns list of surveys when successful", () async {
      Response response = Response(
          requestOptions: RequestOptions(path: ""), statusCode: 200, data: []);

      when(dio.get(ApiPath.survey, options: anyNamed("options")))
          .thenAnswer((_) async => Future.value(response));

      await surveyProvider.getAllSurvey();

      verify(dio.get(ApiPath.survey, options: anyNamed("options")));
    });

    test("should throws server failure when failed", () async {
      ServerFailure failure =
          const ServerFailure("SurveyProvider: failed to get survey");

      when(dio.get(ApiPath.survey,
              options: anyNamed('options'),
              queryParameters: anyNamed('queryParameters')))
          .thenThrow(failure);

      expect(() => surveyProvider.getAllSurvey(), throwsA(failure));
    });
  });

  group("getSurvey()", () {
    test("should returns a survey when successful", () async {
      Response response = Response(
        requestOptions: RequestOptions(path: ""),
        statusCode: 200,
        data: {
          "id": "id",
          "survey_name": "survey_name",
          "status": 1,
          "total_respondent": 1,
          "created_at": "created_at",
          "updated_at": "updated_at",
          "questions": [],
        },
      );

      when(dio.get("${ApiPath.survey}/id", options: anyNamed("options")))
          .thenAnswer((_) async => Future.value(response));

      await surveyProvider.getSurvey('id');

      verify(dio.get("${ApiPath.survey}/id", options: anyNamed("options")));
    });

    test("should throws server failure when failed", () async {
      ServerFailure failure =
          const ServerFailure("SurveyProvider: failed to get survey");

      when(dio.get("${ApiPath.survey}/id",
              options: anyNamed('options'),
              queryParameters: anyNamed('queryParameters')))
          .thenThrow(failure);

      expect(() => surveyProvider.getSurvey('id'), throwsA(failure));
    });
  });
}
