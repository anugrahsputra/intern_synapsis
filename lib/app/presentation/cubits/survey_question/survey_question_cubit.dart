import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/domain.dart';

part 'survey_question_cubit.freezed.dart';
part 'survey_question_state.dart';

class SurveyQuestionCubit extends Cubit<SurveyQuestionState> {
  final GetSurveyUsecase getSurveyUsecase;
  SurveyQuestionCubit({
    required this.getSurveyUsecase,
  }) : super(const SurveyQuestionState.loading());

  Future<void> getQuestion(String id) async {
    emit(const SurveyQuestionState.loading());
    final result = await getSurveyUsecase.call(id);
    result.fold((fail) {
      emit(const SurveyQuestionState.error());
    }, (survey) {
      emit(SurveyQuestionState.loaded(survey));
    });
  }
}
