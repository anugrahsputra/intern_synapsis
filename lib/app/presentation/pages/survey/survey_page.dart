import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';
import '../../presentation.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  _getData() {
    context.read<SurveyCubit>().getAllSurveys();
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SurveyCubit, SurveyState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            allSurveyLoaded: (survey) {
              List<SurveyEntity>? surveys = survey;
              return ListView.builder(
                itemCount: surveys.length,
                itemBuilder: (context, index) {
                  final survey = surveys[index];
                  return Text(survey.surveyName ?? 'Not found');
                },
              );
            },
            surveyLoaded: (survey) => const SizedBox(),
            error: (message) => Text(message),
          );
        },
      ),
    );
  }
}
