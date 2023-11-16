import 'package:equatable/equatable.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class QuestionModel extends Equatable {
  final String? id;
  final int? questionNumber;
  final String? surveyId;
  final String? section;
  final InputType? inputType;
  final String? questionName;
  final String? questionSubject;
  final List<OptionModel>? options;

  const QuestionModel({
    required this.id,
    required this.questionNumber,
    required this.surveyId,
    required this.section,
    required this.inputType,
    required this.questionName,
    required this.questionSubject,
    required this.options,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['question_id'],
      questionNumber: json['question_number'],
      surveyId: json['survey_id'],
      section: json['section'],
      inputType: stringToInputType(json['input_type']),
      questionName: json['question_name'],
      questionSubject: json['question_subject'],
      options: json['options'] != null
          ? (json['options'] as List)
              .map((i) => OptionModel.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question_number': questionNumber,
      'survey_id': surveyId,
      'section': section,
      'input_type': inputTypeToString(inputType),
      'question_name': questionName,
      'question_subject': questionSubject,
      'options': options ?? options?.map((option) => option.toJson()).toList()
    };
  }

  QuestionEntity toEntity() {
    return QuestionEntity(
      id: id,
      questionNumber: questionNumber,
      surveyId: surveyId,
      section: section,
      inputType: inputType,
      questionName: questionName,
      questionSubject: questionSubject,
      options: options?.map((option) => option.toEntity()).toList(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        questionName,
        questionNumber,
        questionSubject,
        surveyId,
        section,
        inputType,
        options,
      ];
}
