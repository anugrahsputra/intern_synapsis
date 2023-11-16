import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intern_synapsis/app/domain/domain.dart';
import 'package:mockito/mockito.dart';

import '../../helper/mock.dart';

void main() {
  late MockSurveyRepository surveyRepository;
  late GetSurveyUsecase usecase;

  setUp(() {
    surveyRepository = MockSurveyRepository();
    usecase = GetSurveyUsecase(repository: surveyRepository);
  });

  const tId = "1";

  const tSurveyEntity = SurveyEntity(
    id: "id",
    surveyName: "surveyName",
    status: 1,
    totalRespondent: 1,
    createdAt: "createdAt",
    updatedAt: "updatedAt",
    questions: [],
  );

  test("should get survey from the repository", () async {
    when(surveyRepository.getSurvey(any))
        .thenAnswer((_) async => const Right(tSurveyEntity));

    final result = await usecase.call(tId);

    expect(result, const Right(tSurveyEntity));
  });
}
