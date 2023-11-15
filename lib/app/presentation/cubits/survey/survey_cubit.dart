import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/domain.dart';

part 'survey_cubit.freezed.dart';
part 'survey_state.dart';

class SurveyCubit extends Cubit<SurveyState> {
  final GetAllSurveyUsecase getAllSurveyUsecase;
  final GetSurveyUsecase getSurveyUsecase;

  SurveyCubit({
    required this.getAllSurveyUsecase,
    required this.getSurveyUsecase,
  }) : super(const SurveyState.initial());

  Future<void> getAllSurveys() async {
    emit(const SurveyState.loading());
    final result = await getAllSurveyUsecase.call();
    result.fold((fail) {
      emit(SurveyState.error(fail.message));
    }, (survey) {
      emit(SurveyState.allSurveyLoaded(survey));
    });
  }
}
