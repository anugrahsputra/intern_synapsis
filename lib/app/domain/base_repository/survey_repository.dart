import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../domain.dart';

abstract class SurveyRepository {
  Future<Either<Failure, List<SurveyEntity>>> getAllSurveys();
  Future<Either<Failure, SurveyEntity>> getSurvey(String id);
}
