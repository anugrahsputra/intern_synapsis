part of 'survey_cubit.dart';

@freezed
class SurveyState with _$SurveyState {
  const factory SurveyState.initial() = _Initial;
  const factory SurveyState.loading() = _Loading;
  const factory SurveyState.allSurveyLoaded(List<SurveyEntity> surveyList) =
      _AllSurveyLoaded;
  const factory SurveyState.surveyLoaded(SurveyEntity survey) = _SurveyLoaded;
  const factory SurveyState.error(String message) = _Error;
}
