import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intern_synapsis/app/domain/domain.dart';
import 'package:mockito/mockito.dart';

import '../../helper/mock.dart';

void main() {
  late MockSurveyRepository surveyRepository;
  late GetAllSurveyUsecase usecase;

  setUp(() {
    surveyRepository = MockSurveyRepository();
    usecase = GetAllSurveyUsecase(repository: surveyRepository);
  });

  final tSurveyEntity = <SurveyEntity>[];

  test(
    "should get list of surveys from the repository",
    () async {
      when(surveyRepository.getAllSurveys())
          .thenAnswer((_) async => Right(tSurveyEntity));

      final result = await usecase.call();

      expect(result, Right(tSurveyEntity));
    },
  );
}
