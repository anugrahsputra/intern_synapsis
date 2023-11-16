import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../domain.dart';

class GetAllSurveyUsecase {
  final SurveyRepository repository;

  GetAllSurveyUsecase({required this.repository});

  Future<Either<Failure, List<SurveyEntity>>> call() {
    return repository.getAllSurveys();
  }
}
