import 'package:equatable/equatable.dart';

class UserAnswersEntity extends Equatable {
  final String? surveyId;
  final List<AnswersEntity> answers;

  const UserAnswersEntity({required this.surveyId, required this.answers});

  @override
  List<Object?> get props => [surveyId, answers];
}

class AnswersEntity extends Equatable {
  final String? questionId;
  final String? answer;

  const AnswersEntity({required this.questionId, required this.answer});

  @override
  List<Object?> get props => [questionId, answer];
}
