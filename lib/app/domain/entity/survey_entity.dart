import 'package:equatable/equatable.dart';

import '../domain.dart';

class SurveyEntity extends Equatable {
  final String? id;
  final String? surveyName;
  final int? status;
  final int? totalRespondent;
  final String? createdAt;
  final String? updatedAt;
  final List<QuestionEntity>? questions;

  const SurveyEntity({
    required this.id,
    required this.surveyName,
    required this.status,
    required this.totalRespondent,
    required this.createdAt,
    required this.updatedAt,
    required this.questions,
  });

  @override
  List<Object?> get props => [
        id,
        surveyName,
        status,
        totalRespondent,
        createdAt,
        updatedAt,
        questions,
      ];
}
