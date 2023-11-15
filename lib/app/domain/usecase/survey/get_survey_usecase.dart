import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../domain.dart';

class GetSurveyUsecase {
  final SurveyRepository repository;

  GetSurveyUsecase({required this.repository});

  Future<Either<Failure, SurveyEntity>> call(String id) {
    return repository.getSurvey(id);
  }
}
