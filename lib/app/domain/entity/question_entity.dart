// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../core/core.dart';
import '../domain.dart';

class QuestionEntity extends Equatable {
  late String? id;
  final int? questionNumber;
  final String? surveyId;
  final String? section;
  final InputType? inputType;
  final String? questionName;
  final String? questionSubject;
  final List<OptionEntity>? options;

  QuestionEntity({
    required this.id,
    required this.questionNumber,
    required this.surveyId,
    required this.section,
    required this.inputType,
    required this.questionName,
    required this.questionSubject,
    required this.options,
  });

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
