import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intern_synapsis/app/core/core.dart';
import 'package:intern_synapsis/app/data/data.dart';
import 'package:intern_synapsis/app/domain/domain.dart';
import 'package:mockito/mockito.dart';

import '../../helper/mock.dart';

void main() {
  late MockSurveyProvider surveyProvider;
  late SurveyRepository surveyRepository;

  setUp(() {
    surveyProvider = MockSurveyProvider();
    surveyRepository = SurveyRepositoryImpl(surveyProvider: surveyProvider);
  });

  const tSurveyId = '1';

  const tSurveyModel = SurveyModel(
    id: "id",
    surveyName: "surveyName",
    status: 1,
    totalRespondent: 1,
    createdAt: "createdAt",
    updatedAt: "updatedAt",
    questions: [],
  );

  const tSurveyEntity = SurveyEntity(
    id: "id",
    surveyName: "surveyName",
    status: 1,
    totalRespondent: 1,
    createdAt: "createdAt",
    updatedAt: "updatedAt",
    questions: [],
  );

  final tSurveyModelList = <SurveyModel>[tSurveyModel];

  final tSurveyEntityList = <SurveyEntity>[tSurveyEntity];

  group("getAllSurveys", () {
    test(
        "should return list of SurveyEntity when the call to SurveyProvider is successful",
        () async {
      when(surveyProvider.getAllSurvey())
          .thenAnswer((_) async => tSurveyModelList);

      final result = await surveyRepository.getAllSurveys();

      verify(surveyProvider.getAllSurvey());

      final resultList = result.getOrElse(() => []);

      expect(resultList, tSurveyEntityList);
    });

    test('should return server failure when call to api is unsuccessfull',
        () async {
      when(surveyProvider.getAllSurvey()).thenThrow(ServerException());

      final result = await surveyRepository.getAllSurveys();

      verify(surveyProvider.getAllSurvey());
      expect(result, equals(const Left(ServerFailure('Something went wrong'))));
    });

    test('should return connection failure when call to api is unsuccessfull',
        () async {
      when(surveyProvider.getAllSurvey())
          .thenThrow(const SocketException('Failed to connect to the network'));

      final result = await surveyRepository.getAllSurveys();

      verify(surveyProvider.getAllSurvey());
      expect(
          result, equals(const Left(ConnectionFailure('Connection Failure'))));
    });
  });

  group("getSurvey", () {
    test(
        "should return SurveyEntity when the call to SurveyProvider is successful",
        () async {
      when(surveyProvider.getSurvey(any)).thenAnswer((_) async => tSurveyModel);

      final result = await surveyRepository.getSurvey(tSurveyId);

      verify(surveyProvider.getSurvey(tSurveyId));
      expect(result, const Right(tSurveyEntity));
    });

    test('should return server failure when call to api is unsuccessfull',
        () async {
      when(surveyProvider.getSurvey(any)).thenThrow(ServerException());

      final result = await surveyRepository.getSurvey(tSurveyId);

      verify(surveyProvider.getSurvey(tSurveyId));
      expect(result, equals(const Left(ServerFailure('Something went wrong'))));
    });

    test('should return connection failure when call to api is unsuccessfull',
        () async {
      when(surveyProvider.getSurvey(any))
          .thenThrow(const SocketException('Failed to connect to the network'));

      final result = await surveyRepository.getSurvey(tSurveyId);

      verify(surveyProvider.getSurvey(tSurveyId));
      expect(
          result, equals(const Left(ConnectionFailure('Connection Failure'))));
    });
  });
}
