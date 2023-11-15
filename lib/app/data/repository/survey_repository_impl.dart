import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class SurveyRepositoryImpl implements SurveyRepository {
  final SurveyProvider surveyProvider;

  SurveyRepositoryImpl({required this.surveyProvider});

  @override
  Future<Either<Failure, List<SurveyEntity>>> getAllSurveys() async {
    try {
      final result = await surveyProvider.getAllSurvey();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('Something went wrong'));
    } on SocketException {
      return const Left(ConnectionFailure('Connection Failure'));
    }
  }

  @override
  Future<Either<Failure, SurveyEntity>> getSurvey(String id) async {
    try {
      final result = await surveyProvider.getSurvey(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Something went wrong'));
    } on SocketException {
      return const Left(ConnectionFailure('Connection Failure'));
    }
  }
}
