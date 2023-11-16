part of 'survey_cubit.dart';

@freezed
class SurveyState with _$SurveyState {
  const factory SurveyState.initial() = _Initial;
  const factory SurveyState.loading() = _Loading;
  const factory SurveyState.loaded(List<SurveyEntity> surveyList) = _Loaded;
  const factory SurveyState.error(String message) = _Error;
}
