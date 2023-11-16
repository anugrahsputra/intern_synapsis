part of 'survey_question_cubit.dart';

@freezed
class SurveyQuestionState with _$SurveyQuestionState {
  const factory SurveyQuestionState.error() = _Error;
  const factory SurveyQuestionState.loading() = _Loading;
  const factory SurveyQuestionState.loaded(SurveyEntity survey) = _Loaded;
}
