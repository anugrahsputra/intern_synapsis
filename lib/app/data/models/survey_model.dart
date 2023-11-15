import 'package:equatable/equatable.dart';

import '../../domain/domain.dart';
import '../data.dart';

class SurveyModel extends Equatable {
  final String? id;
  final String? surveyName;
  final int? status;
  final int? totalRespondent;
  final String? createdAt;
  final String? updatedAt;
  final List<QuestionModel>? questions;

  const SurveyModel({
    required this.id,
    required this.surveyName,
    required this.status,
    required this.totalRespondent,
    required this.createdAt,
    required this.updatedAt,
    required this.questions,
  });

  factory SurveyModel.fromJson(Map<String, dynamic> json) {
    return SurveyModel(
      id: json['id'],
      surveyName: json['survey_name'],
      status: json['status'],
      totalRespondent: json['total_respondent'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      questions: (json['questions'] as List)
          .map((i) => QuestionModel.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "survey_name": surveyName,
      "status": status,
      "total_responden": totalRespondent,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "question": questions?.map((question) => question.toJson()).toList()
    };
  }

  SurveyEntity toEntity() {
    return SurveyEntity(
      id: id,
      surveyName: surveyName,
      status: status,
      totalRespondent: totalRespondent,
      createdAt: createdAt,
      updatedAt: updatedAt,
      questions: questions?.map((question) => question.toEntity()).toList(),
    );
  }

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
