import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../../injection.dart';
import '../../presentation.dart';

part 'survey_page.component.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  final AppNavigator navigate = sl<AppNavigator>();

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
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () => CustomDialog.show(context),
          initial: () => navigate.goToSplash(context),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Halaman Survey',
            style: GoogleFonts.inter(
              fontSize: 21,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<AuthCubit>().logout();
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: BlocBuilder<SurveyCubit, SurveyState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Text('initial'),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (survey) {
                List<SurveyEntity>? surveys = survey;
                return ListView.builder(
                  itemCount: surveys.length,
                  itemBuilder: (context, index) {
                    final survey = surveys[index];
                    return ListSurveyView(
                      survey: survey,
                      onTap: () => navigate.goToSurveyQuestion(context,
                          surveyId: survey.id!),
                    );
                  },
                );
              },
              error: (message) => Text(message),
            );
          },
        ),
      ),
    );
  }
}
